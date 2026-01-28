pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // ===== INTERFACE =====
    property string iface: ""

    // ===== RATE (bytes/sec) =====
    property int rxRate: 0
    property int txRate: 0

    // ===== MAX RATE (bytes/sec) =====
    property int maxRx: 0
    property int maxTx: 0

    // ===== TOTAL (bytes) =====
    property double totalRx: 0
    property double totalTx: 0

    // ===== INTERNAL =====
    property double lastRx: 0
    property double lastTx: 0

    // ===== TIMER =====
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: proc.running = true
    }

    // ===== FORMAT SPEED (MAX ±3 DIGIT) =====
    function formatSpeed(bytes) {
        if (bytes <= 0)
            return { value: "0.0", unit: "kb/s" }

        // KB/s
        if (bytes < 1024 * 1024) {
            const v = bytes / 1024
            return {
                value: v.toFixed(v < 10 ? 1 : 0),
                unit: "kb/s"
            }
        }

        // MB/s
        const m = bytes / (1024 * 1024)
        return {
            value: m.toFixed(m < 10 ? 2 : 1),
            unit: "mb/s"
        }
    }

    // ===== FORMAT TOTAL =====
    function formatTotal(bytes) {
        const kb = 1024
        const mb = 1024 * 1024
        const gb = 1024 * 1024 * 1024

        if (bytes < mb)
            return { value: (bytes / kb).toFixed(0), unit: "kb" }

        if (bytes < gb)
            return { value: (bytes / mb).toFixed(1), unit: "mb" }

        return { value: (bytes / gb).toFixed(2), unit: "gb" }
    }

    // ===== PROCESS =====
    Process {
        id: proc
        command: ["cat", "/proc/net/dev"]

        stdout: SplitParser {
            onRead: (read) => {
                const lines = read.split("\n")

                for (const line of lines) {
                    if (!line.includes(":"))
                        continue

                    const name = line.split(":")[0].trim()

                    // FILTER interface
                    if (name === "lo") continue
                    if (name.startsWith("docker")) continue
                    if (name.startsWith("vir")) continue

                    const parts = line.split(":")[1].trim().split(/\s+/)
                    const rx = Number(parts[0])
                    const tx = Number(parts[8])

                    // pilih interface aktif
                    if (rx > 0 || tx > 0) {

                        // RESET kalau pindah interface
                        if (root.iface !== name) {
                            root.lastRx = 0
                            root.lastTx = 0
                            root.maxRx = 0
                            root.maxTx = 0
                        }

                        root.iface = name
                        root.totalRx = rx
                        root.totalTx = tx

                        if (root.lastRx > 0) {
                            root.rxRate = Math.max(0, rx - root.lastRx)
                            root.txRate = Math.max(0, tx - root.lastTx)

                            // UPDATE MAX
                            root.maxRx = Math.max(root.maxRx, root.rxRate)
                            root.maxTx = Math.max(root.maxTx, root.txRate)
                        }

                        root.lastRx = rx
                        root.lastTx = tx
                        break
                    }
                }
            }
        }
    }
}
