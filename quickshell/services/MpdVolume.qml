import QtQuick
import Quickshell.Io

Item {
    id: mpdVolume

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
        getProc.running = true;
    }

    function setVolume(percent) {
        percent = Math.max(0, Math.min(100, percent));
        setProc.command = ["mpc", "volume", percent.toString()];
        setProc.running = true;
    }

    Component.onCompleted: refresh()

    Process {
        id: getProc

        command: ["mpc", "volume"]

        stdout: SplitParser {
            onRead: (data) => {
                // contoh output: "volume: 42%"
                const m = data.match(/(\d+)%/);
                if (m)
                    mpdVolume.level = parseInt(m[1]);

            }
        }

    }

    Process {
        id: setProc
    }

    Timer {
        interval: 2000
        repeat: true
        running: autoPoll
        onTriggered: refresh()
    }

}
