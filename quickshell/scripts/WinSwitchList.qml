import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.state

Item {
    id: root

    property var windows: []
    property string buffer: ""

    function refresh() {
        buffer = "";
        proc.running = true;
    }

    Component.onCompleted: refresh()

    Process {
        id: proc

        command: ["sh", "-c", "hyprctl clients -j"]
        running: false
        onExited: {
            try {
                root.windows = JSON.parse(root.buffer);
                console.log("Loaded windows:", root.windows.length);
            } catch (e) {
                console.warn("JSON parse error", e);
            }
        }

        stdout: SplitParser {
            onRead: (data) => {
                root.buffer += data;
            }
        }

    }

}
