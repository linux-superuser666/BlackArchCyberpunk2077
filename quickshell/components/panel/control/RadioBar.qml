import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.styles

Rectangle {
    id: root

    property bool musicPlaying: false
    property string musicState: "󰓛"

    function randomHeight(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function resetBars() {
        bar1.height = 4;
        bar2.height = 6;
        bar3.height = 5;
        bar4.height = 7;
    }

    width: 35
    height: 35
    color: "transparent"

    Process {
        id: mpdStatusProc

        command: ["sh", "-c", "LANG=C mpc status %state%"]
        running: true

        stdout: SplitParser {
            onRead: function(state) {
                state = state.trim();
                if (state === "playing") {
                    musicPlaying = true;
                    musicState = "󰐊";
                } else if (state === "󰏤") {
                    musicPlaying = false;
                    musicState = "pause";
                    resetBars();
                } else {
                    musicPlaying = false;
                    musicState = "󰓛";
                    resetBars();
                }
            }
        }

    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: mpdStatusProc.running = true
    }

    Timer {
        interval: 250
        repeat: true
        running: musicPlaying
        onTriggered: {
            bar1.height = randomHeight(4, 18);
            bar2.height = randomHeight(6, 22);
            bar3.height = randomHeight(5, 16);
            bar4.height = randomHeight(7, 24);
        }
    }

    Row {
        spacing: 2
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: bar1

            width: 3
            height: 8
            color: Colors.yellow_goldx
            anchors.bottom: parent.bottom

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        }

        Rectangle {
            id: bar2

            width: 3
            height: 15
            color: Colors.yellow_goldx
            anchors.bottom: parent.bottom

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        }

        Rectangle {
            id: bar3

            width: 3
            height: 10
            color: Colors.yellow_goldx
            anchors.bottom: parent.bottom

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        }

        Rectangle {
            id: bar4

            width: 3
            height: 17
            color: Colors.yellow_goldx
            anchors.bottom: parent.bottom

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        }

    }

    ColumnLayout {
        spacing: 0

        Rectangle {
            color: "transparent"
            width: 5
            height: 5
        }

        Rectangle {
            color: "transparent"
            width: 37
            height: 41

            Text {
                text: musicState
                anchors.right: parent.right
                font.pixelSize: 14
                font.family: "Rajdhani"
                font.weight: Font.DemiBold
                color: Colors.orangex
            }

        }

    }

}
