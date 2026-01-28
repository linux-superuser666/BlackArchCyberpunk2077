pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // ===== DATA =====
    property double latitude: 0.0
    property double longitude: 0.0
    property string city: ""
    property string country: ""
    property bool ready: false

    // ===== TIMER =====
    Timer {
        interval: 10 * 60 * 1000   // update setiap 10 menit
        running: true
        repeat: true
        onTriggered: geoProc.running = true
    }

    Component.onCompleted: geoProc.running = true

    // ===== PROCESS =====
    Process {
        id: geoProc
        command: ["curl", "-s", "https://ipinfo.io/json"]

        stdout: StdioCollector {
            // onStreamFinished memberi seluruh text ketika proses selesai
            onStreamFinished: {
                if (!text || text.length === 0)
                    return

                try {
                    const data = JSON.parse(text)

                    if (!data.loc)
                        return

                    const parts = data.loc.split(",")

                    root.latitude = Number(parts[0])
                    root.longitude = Number(parts[1])
                    root.city = data.city ?? ""
                    root.country = data.country ?? ""
                    root.ready = true
                } catch (e) {
                    console.warn("GeoLocation parse error:", e, text)
                }
            }
        }
    }
}
