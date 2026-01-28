import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.typography
import qs.services
import qs.state
import qs.styles

PanelWindow {
    id: launcher

    required property var screen

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: 600
    implicitHeight: 170
    visible: GlobalState.netPopupVisible
    onVisibleChanged: {
        visible ? popUpIn.play() : popUpOut.play();
    }

    SoundEffect {
        id: popUpOut

        source: "../assets/fx/notify-out.wav"
        volume: 0.8
    }

    SoundEffect {
        id: popUpIn

        source: "../assets/fx/notify-in.wav"
        volume: 0.8
    }

    anchors {
        bottom: true
        left: true
    }

    RowLayout {
        id: netPopUpContentColumn

        width: Math.min(implicitWidth, 400)
        height: parent.height
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 190
        opacity: GlobalState.netPopupVisible ? 1 : 0
        x: GlobalState.netPopupVisible ? 0 : -width
        spacing: 0

        Rectangle {
            color: "transparent"
            width: 300
            height: 40

            ColumnLayout {
                id: batteryContentColumn

                spacing: 0
                anchors.left: parent.left

                Rectangle {
                    ColumnLayout {
                        spacing: 10
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                        Rectangle {
                            id: panelSystem

                            color: "transparent"
                            width: 300
                            height: 290

                            RowLayout {
                                anchors.fill: parent
                                spacing: 5

                                Rectangle {
                                    Layout.preferredWidth: 20
                                    Layout.alignment: Qt.AlignTop
                                    color: "transparent"

                                    ColumnLayout {
                                        spacing: 3

                                        Rectangle {
                                            width: 24
                                            height: 25
                                            color: "transparent"

                                            BinLines {
                                            }

                                        }

                                        Rectangle {
                                            width: 25
                                            height: 17
                                            color: "transparent"

                                            Image {
                                                // : "../assets/icons/popup/netlan.png"

                                                width: 16
                                                height: 16
                                                source: "../assets/icons/popup/netwifi.png"
                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignTop
                                    color: "transparent"

                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 1

                                        Orbitron {
                                            text: "connection 655.441.20"
                                            size: 8
                                            color: Colors.redx70
                                            uppercase: true
                                        }
                                        // ⬅️ CONTENT

                                        Rectangle {
                                            width: 300
                                            height: 20
                                            Layout.alignment: Qt.AlignTop
                                            color: "transparent"

                                            RowLayout {
                                                Layout.fillWidth: true
                                                anchors.verticalCenter: parent.verticalCenter

                                                ArrowUp {
                                                    fillColor: Colors.yellow_goldx
                                                    width: 12
                                                    height: 8
                                                }

                                                Rajdhani {
                                                    text: "00"
                                                    size: Texts.sm
                                                    fontWeight: "semibold"
                                                    color: Colors.cyanx
                                                }

                                                ArrowDown {
                                                    fillColor: Colors.redx
                                                    width: 12
                                                    height: 8
                                                }

                                                Rajdhani {
                                                    text: "00"
                                                    fontWeight: "semibold"
                                                    size: Texts.sm
                                                    color: Colors.cyanx
                                                }

                                            }

                                        }

                                    }

                                }

                            }

                        }

                    }

                }

            }

        }

        Behavior on x {
            NumberAnimation {
                duration: 260
                easing.type: Easing.OutCubic
            }

        }

        Behavior on opacity {
            NumberAnimation {
                duration: 160
            }

        }

    }

}
