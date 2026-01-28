import QtQuick
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    required property var screen

    screen: screen
    implicitHeight: 768
    color: "transparent"
    implicitWidth: 15
    WlrLayershell.layer: WlrLayer.Bottom

    anchors {
        left: true
        top: true
    }

    RowLayout {
        id: row

        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        spacing: 0

        Rectangle {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            height: 768
            color: "transparent"
            width: 10

            Text {
                text: "00032 05 54 DB CP 00032 05 54 DB CP"
                font.family: "Rajdhani"
                font.bold: true
                color: Qt.rgba(255, 0, 0, 0.5)
                font.pixelSize: 8
                anchors.centerIn: parent
                font.letterSpacing: 1
                rotation: 90
                transformOrigin: Item.Center
            }

        }

        Rectangle {
            // ================= GARIS ATAS =================

            height: 768
            width: 5
            color: "transparent"
            opacity: 0.8

            Image {
                anchors.fill: parent
                source: "../assets/images/scanner/scanner-right-bg.png"
                fillMode: Image.Stretch
            }

            Item {
                id: scanArea

                anchors.fill: parent
                clip: true
            }

            Rectangle {
                id: scanUp

                width: topLeftCol.implicitWidth
                height: 40
                color: "transparent"

                Column {
                    id: topLeftCol

                    anchors.centerIn: parent
                    spacing: 1

                    Rectangle {
                        width: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 5
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 5
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 4
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 2
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 1
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 1
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                }

            }

            // ================= GARIS BAWAH =================
            Rectangle {
                id: scanDown

                parent: scanArea
                width: botLeftCol.implicitWidth
                height: 40
                color: Qt.rgba(255, 255, 255, 0)
                y: (scanArea.height - height) / 2

                Column {
                    id: botLeftCol

                    anchors.centerIn: parent
                    spacing: 1

                    Rectangle {
                        width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 1
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 2
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 3
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 5
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        width: 5
                        height: 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 2
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 5
                        height: 3
                        radius: 5
                        color: Qt.rgba(1, 1, 1, 0.2)
                    }

                }

            }

            // ================= ANIMASI =================
            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                ParallelAnimation {
                    // KE ATAS
                    NumberAnimation {
                        target: scanUp
                        property: "y"
                        from: (scanArea.height - scanUp.height) / 2
                        to: -scanUp.height
                        duration: 4000
                        easing.type: Easing.Linear
                    }

                    // KE BAWAH
                    NumberAnimation {
                        target: scanDown
                        property: "y"
                        from: (scanArea.height - scanDown.height) / 2
                        to: scanArea.height
                        duration: 4000
                        easing.type: Easing.Linear
                    }

                }

                // ⏸️ DELAY SEBELUM RESET
                PauseAnimation {
                    duration: 3000 // 2 detik
                }

                // RESET TANPA ANIMASI
                ScriptAction {
                    script: {
                        scanUp.y = (scanArea.height - scanUp.height) / 2;
                        scanDown.y = (scanArea.height - scanDown.height) / 2;
                    }
                }

            }

        }

    }

}
