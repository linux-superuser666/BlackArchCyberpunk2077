import QtQuick
import Quickshell.Io

Item {
    id: qsVolume

    // Stream ID dari wpctl status
    property int streamId: 67
    property int level: 0
    property int step: 5
    property bool autoPoll: true

    function up() {
        setVolume(level + step);
    }

    function down() {
        setVolume(level - step);
    }

    function refresh() {
        volGetProc.running = true;
    }

    function setVolume(percent) {
        percent = Math.max(0, Math.min(100, percent));
        setVolProc.command = ["wpctl", "set-volume", streamId.toString(), percent + "%"];
        setVolProc.running = true;
    }

    Component.onCompleted: refresh()

    Process {
        id: volGetProc

        command: ["wpctl", "get-volume", streamId.toString()]

        stdout: SplitParser {
            onRead: (data) => {
                const m = data.match(/([\d.]+)/);
                if (m)
                    qsVolume.level = Math.round(parseFloat(m[1]) * 100);

            }
        }

    }

    Process {
        id: setVolProc
    }

    Timer {
        interval: 1000
        repeat: true
        running: autoPoll
        onTriggered: refresh()
    }

}
