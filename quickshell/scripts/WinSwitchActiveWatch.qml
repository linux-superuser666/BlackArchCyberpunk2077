// scripts/WinSwitchActiveWatch.qml
import QtQuick
import Quickshell.Io

Item {
    id: root

    property string address: ""

    Timer {
        interval: 300
        repeat: true
        running: true
        onTriggered: proc.running = true
    }

    Process {
        id: proc

        command: ["sh", "-c", "hyprctl activewindow -j"]
        running: false

        stdout: SplitParser {
            onRead: (data) => {
                try {
                    const obj = JSON.parse(data);
                    if (obj.address)
                        root.address = obj.address;

                } catch (e) {
                }
            }
        }

    }

}
