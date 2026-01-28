import QtQuick
import Quickshell.Io

Item {
    id: diskService

    property string freeDisk: "0.00"

    Process {
        id: diskProc

        command: ["sh", "-c", "df -B1 / | tail -1"]

        stdout: SplitParser {
            onRead: function(data) {
                let p = data.trim().split(/\s+/);
                let freeBytes = parseInt(p[3]);
                diskService.freeDisk = (freeBytes / (1024 * 1024 * 1024)).toFixed(2);
            }
        }

    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: diskProc.running = true
    }

}
