import QtQuick
import Quickshell.Io

Item {
    id: cpuService

    property int cpuUse: 0

    Process {
        id: cpuProc

        property int lastTotal: 0
        property int lastIdle: 0

        command: ["sh", "-c", "grep 'cpu ' /proc/stat"]

        stdout: SplitParser {
            onRead: function(data) {
                let p = data.trim().split(/\s+/);
                let idle = parseInt(p[4]);
                let total = p.slice(1).reduce((a, b) => {
                    return a + parseInt(b);
                }, 0);
                if (cpuProc.lastTotal > 0) {
                    let tDiff = total - cpuProc.lastTotal;
                    let iDiff = idle - cpuProc.lastIdle;
                    cpuService.cpuUse = Math.round(100 * (tDiff - iDiff) / tDiff);
                }
                cpuProc.lastTotal = total;
                cpuProc.lastIdle = idle;
            }
        }

    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: cpuProc.running = true
    }

}
