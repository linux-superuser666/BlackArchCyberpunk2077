import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.styles as Styles

Rectangle {
    id: root

    property bool hovers: true

    function randomHeight(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function resetBars() {
        bar1.height = 3;
        bar2.height = 2;
        bar3.height = 4;
        bar4.height = 5;
    }

    width: 10
    height: 10
    color: "transparent"

    Timer {
        interval: 250
        repeat: true
        running: hovers
        onTriggered: {
            bar1.height = randomHeight(4, 10);
            bar2.height = randomHeight(6, 12);
            bar3.height = randomHeight(5, 13);
            bar4.height = randomHeight(7, 11);
        }
    }

    Row {
        spacing: 2
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 7
            height: 6
            color: "transparent"
        }

        Rectangle {
            id: bar1

            width: 2
            height: 8
            color: Styles.Colors.greyx
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

            width: 2
            height: 15
            color: Styles.Colors.greyx
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

            width: 2
            height: 10
            color: Styles.Colors.greyx
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

            width: 2
            height: 17
            color: Styles.Colors.greyx
            anchors.bottom: parent.bottom

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        }

    }

}
