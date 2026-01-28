import QtQuick
import Quickshell.Io

Item {
    id: root

    // public API
    property string count: "0"
    property int interval: 3.6e+06 // 1 jam

    signal updated(string count)

    function refresh() {
        proc.running = false;
        proc.running = true;
    }

    Component.onCompleted: refresh()

    Process {
        id: proc

        running: false
        command: ["/bin/bash", "-c", "/home/mrnngstr666/.config/hypr/scripts/checkupdates"]

        stdout: SplitParser {
            onRead: function(line) {
                root.count = line.trim();
                root.updated(root.count);
            }
        }

    }

    Timer {
        interval: root.interval
        running: true
        repeat: true
        onTriggered: root.refresh()
    }

}
