import QtQuick
import Quickshell
import Quickshell.Io
import qs.state as GlobalState

Item {
    id: root

    property var audioPresets: []
    property string buffer: ""

    function refresh() {
        buffer = "";
        proc.running = true;
    }

    function parseWpctl(text) {
        const list = [];
        const lines = text.split("\n");
        for (const line of lines) {
            const m = line.match(/\*\s+(\d+)\.\s+([^\[\│]+)/);
            if (m)
                list.push({
                "id": Number(m[1]),
                "label": m[2].trim()
            });

        }
        return list;
    }

    Component.onCompleted: {
        refresh();
    }

    Timer {
        id: refreshTimer

        interval: 800
        repeat: true
        running: !!GlobalState.levelPanelActive
        onTriggered: {
            refresh();
        }
    }

    Process {
        id: proc

        command: ["sh", "-c", "wpctl status"]
        running: false
        onExited: {
            try {
                audioPresets = parseWpctl(buffer);
            } catch (e) {
                console.warn("[AudioPreset] Audio parse error", e);
            }
        }

        stdout: SplitParser {
            onRead: (data) => {
                buffer += data;
            }
        }

    }

}
