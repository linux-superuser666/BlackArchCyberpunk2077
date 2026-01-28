import QtQuick
import Quickshell.Io

Item {
    id: volumeService

    property int level: 0
    property int step: 5
    property bool autoPoll: true

    function up() {
        volUpProc.running = true;
        volGetProc.running = true;
    }

    function down() {
        volDownProc.running = true;
        volGetProc.running = true;
    }

    function refresh() {
        volGetProc.running = true;
    }

    function setVolume(percent) {
        percent = Math.max(0, Math.min(100, percent));
        setVolProc.command = ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", percent + "%"];
        setVolProc.running = true;
    }

    Component.onCompleted: refresh()

    Process {
        id: volGetProc

        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]

        stdout: SplitParser {
            onRead: (data) => {
                const m = data.match(/([\d.]+)/);
                if (m)
                    volumeService.level = Math.round(parseFloat(m[1]) * 100);

            }
        }

    }

    Process {
        id: setVolProc
    }

    Process {
        id: volUpProc

        command: ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", step + "%+"]
    }

    Process {
        id: volDownProc

        command: ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", step + "%-"]
    }

    Timer {
        interval: 1000
        repeat: true
        running: autoPoll
        onTriggered: volGetProc.running = true
    }

}
