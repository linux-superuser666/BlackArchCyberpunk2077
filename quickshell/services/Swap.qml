import QtQuick
import Quickshell.Io

Item {
    id: swapService

    property int totalSwap: 1
    property int swapUse: 0
    property int swapPercent: Math.round((swapUse / totalSwap) * 100)
    property int swapSlotsUsed: Math.ceil(swapPercent / 10)

    Process {
        id: swapProc

        command: ["sh", "-c", "free | grep Swap"]

        stdout: SplitParser {
            onRead: function(data) {
                let p = data.trim().split(/\s+/);
                swapService.totalSwap = Math.round(parseInt(p[1]) / 1024);
                swapService.swapUse = Math.round(parseInt(p[2]) / 1024);
            }
        }

    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: swapProc.running = true
    }

}
