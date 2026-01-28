import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Io
import qs.components.typography
import qs.components.common
import qs.styles

ColumnLayout {
    id: topBar
    spacing: 5
    Layout.alignment: Qt.AlignRight | Qt.AlignTop

    // ===== Main Panel =====
    Rectangle {
        id: hyprPanelContent
        color: "transparent"
        width: 725
        height: 67

        RowLayout {
            anchors.fill: parent
            spacing: 1

            // ===== Left Section =====
            Rectangle {
                color: "transparent"
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 5

                    // ---- Top Header ----
                    Rectangle {
                        color: "transparent"
                        width: 125
                        height: 10
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight

                        Orbitron {
                            size:8
                            color: Colors.redx70
                            text: "WAYLAND HYPRCTL 1.001.1"
                        }

                    }

                    // ---- Workspace Row ----
                    Rectangle {
                        color:"transparent"
                        height: 10
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight

                        RowLayout {
                            spacing: 20

                            Repeater {
                                model: 9


                                    Rectangle {
                                        height: 20
                                        width: wsText.implicitWidth + 10
                                        color: "transparent"

                                        property var ws: Hyprland.workspaces.values.find(x => x.id === index+1)
                                        property bool focused: Hyprland.focusedWorkspace?.id === index+1
                                        property bool hasWindow: ws !== undefined

                                        RowLayout {
                                            anchors.centerIn: parent
                                            spacing: 4

                                            Image {
                                                width: 14
                                                height: 14
                                                fillMode: Image.PreserveAspectFit
                                                source: focused
                                                    ? topBar.wsIcons[index].active
                                                    : hasWindow
                                                        ? topBar.wsIcons[index].occupied
                                                        : topBar.wsIcons[index].idle
                                            }

                                            Text {
                                                id: wsText
                                                text: topBar.wsNames[index]
                                                font.family: "Rajdhani"
                                                font.pixelSize: 14
                                                font.weight: Font.DemiBold
                                                color: focused ?  Colors.whitex :  Colors.redx

                                            }
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: Hyprland.dispatch("workspace " + (index+1))
                                        }
                                    }

                            }
                        }
                    }

                    // ---- Active Window Name ----
                    RowLayout {
                        spacing:0
                        Layout.alignment: Qt.AlignBottom | Qt.AlignRight

                        Rectangle {
                            color: "transparent"
                            width:100
                            height: 20
                            Layout.alignment: Qt.AlignBottom | Qt.AlignRight

                             Text {
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom

                                text: Hyprland.activeClient?.title
                                    ? Hyprland.activeClient.title.toUpperCase()
                                    : ""

                                color: Colors.greyx
                                font.family: "Rajdhani"
                                font.pixelSize: 12
                                font.bold: true
                            }

                        }

                        Rectangle {
                            color: "transparent"
                            width:7
                            height: 20
                        }
                    }

                }
            }

            Rectangle {
                Layout.preferredWidth: 20
                Layout.alignment: Qt.AlignTop
                color: "transparent"

                ColumnLayout {
                    spacing: 10

                    BinLines {}

                    Rectangle {
                        width: 20
                        height: 18
                        color: "transparent"

                        Image {
                            id: panelHardWareB
                            width: 29
                            height: 24
                            source: "../assets/icons/hypr-dbus.png"
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                }
            }

        }
    }

}
