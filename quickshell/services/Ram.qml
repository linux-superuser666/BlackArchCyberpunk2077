import QtQuick
import Quickshell.Io

Item {
    id: ramService

    property int totalRam: 1
    property int ramUse: 0
    property int ramPercent: Math.round((ramUse / totalRam) * 100)
    property int ramSlotsUsed: Math.ceil(ramPercent / 10)

    Process {
        id: ramProc

        command: ["sh", "-c", "free | grep Mem"]

        stdout: SplitParser {
            onRead: function(data) {
                let p = data.trim().split(/\s+/);
                ramService.totalRam = Math.round(parseInt(p[1]) / 1024);
                ramService.ramUse = Math.round(parseInt(p[2]) / 1024);
            }
        }

    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: ramProc.running = true
    }

}
