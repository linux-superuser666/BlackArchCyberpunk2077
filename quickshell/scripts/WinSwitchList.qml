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
        if (proc.running)
            return ;

        buffer = "";
        proc.running = true;
    }

    Component.onCompleted: refresh()

    Timer {
        id: refreshTimer

        interval: 500
        repeat: true
        running: GlobalState.winSwitchActive
        triggeredOnStart: false
        onTriggered: {
            refresh();
        }
    }

    Process {
        id: proc

        command: ["sh", "-c", "hyprctl clients -j"]
        running: false
        onExited: {
            try {
                root.windows = JSON.parse(buffer);
                console.log("Loaded windows:", windows.length);
            } catch (e) {
                console.warn("JSON parse error", e);
            }
        }

        stdout: SplitParser {
            onRead: (data) => {
                return buffer += data;
            }
        }

    }

}
