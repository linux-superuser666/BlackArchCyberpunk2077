import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.styles as Styles

Rectangle {
    property bool netOnline: false

    width: 40
    color: "transparent"
    height: 41
    anchors.centerIn: parent

    Timer {
        interval: 3000
        repeat: true
        running: true
        onTriggered: netPingProc.running = true
    }

    Process {
        id: netPingProc

        command: ["sh", "-c", "ping -c 1 -W 1 1.1.1.1 >/dev/null && echo online || echo offline"]
        running: true

        stdout: SplitParser {
            onRead: function(line) {
                netOnline = line.trim() === "online";
            }
        }

    }

    Image {
        id: netBoxIcon

        anchors.centerIn: parent
        width: 21
        height: 20
        source: "../../../assets/icons/origin-net.png"
        fillMode: Image.PreserveAspectFit
    }

    RowLayout {
        spacing: 15
        //anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 10
            color: "transparent"
            height: 40

            Text {
                id: netIconTx

                text: "TX"
                font.weight: Font.DemiBold
                font.family: "Rajdhani"
                color: Styles.Colors.orangex
                font.pixelSize: 8
                anchors.bottom: parent.bottom
                opacity: netOnline ? 1 : 0
            }

            SequentialAnimation {
                loops: Animation.Infinite
                running: netOnline

                PropertyAnimation {
                    target: netIconTx
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }

                PropertyAnimation {
                    target: netIconTx
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }

            }

        }

        Rectangle {
            width: 10
            color: "transparent"
            height: 30

            Text {
                id: netIconRx

                text: "RX"
                font.weight: Font.DemiBold
                font.family: "Rajdhani"
                color: Styles.Colors.orangex
                font.pixelSize: 8
                opacity: netOnline ? 1 : 0
            }

            SequentialAnimation {
                loops: Animation.Infinite
                running: netOnline

                PropertyAnimation {
                    target: netIconRx
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }

                PropertyAnimation {
                    target: netIconRx
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }

            }

        }

    }

}
