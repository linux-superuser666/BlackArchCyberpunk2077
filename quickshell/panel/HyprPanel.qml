import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import qs.components.common
import qs.components.typography
import qs.styles


PanelWindow {
    id: hyprPanel

    required property var screen

    property var wsNames: [
        "CYBERWARE",
        "INVENTORY",
        "CRAFTING",
        "NET",
        "JOURNAL",
        "MEDIA",
        "CODEX",
        "MESSAGE",
        "MACHINE"
    ]

    property var wsIcons: [
        { idle: "../assets/ws/ws1-idle.png", occupied: "../assets/ws/ws1-occ.png", active: "../assets/ws/ws1-act.png" },
        { idle: "../assets/ws/ws2-idle.png", occupied: "../assets/ws/ws2-occ.png", active: "../assets/ws/ws2-act.png" },
        { idle: "../assets/ws/ws3-idle.png", occupied: "../assets/ws/ws3-occ.png", active: "../assets/ws/ws3-act.png" },
        { idle: "../assets/ws/ws4-idle.png", occupied: "../assets/ws/ws4-occ.png", active: "../assets/ws/ws4-act.png" },
        { idle: "../assets/ws/ws5-idle.png", occupied: "../assets/ws/ws5-occ.png", active: "../assets/ws/ws5-act.png" },
        { idle: "../assets/ws/ws6-idle.png", occupied: "../assets/ws/ws6-occ.png", active: "../assets/ws/ws6-act.png" },
        { idle: "../assets/ws/ws7-idle.png", occupied: "../assets/ws/ws7-occ.png", active: "../assets/ws/ws7-act.png" },
        { idle: "../assets/ws/ws8-idle.png", occupied: "../assets/ws/ws8-occ.png", active: "../assets/ws/ws8-act.png" },
        { idle: "../assets/ws/ws9-idle.png", occupied: "../assets/ws/ws9-occ.png", active: "../assets/ws/ws9-act.png" }
    ]

    screen: screen
    color: "transparent"
    implicitWidth: 800
    implicitHeight: 55

    WlrLayershell.layer: WlrLayer.Top
 //   Component.onCompleted: {
 //       console.log("Hyprland keys:", Object.keys(Hyprland));
 //   }
    anchors {
        right: true
        top: true
    }

    RowLayout {
        spacing:0
        anchors.fill: parent

        Rectangle {
            width: 750
            height: 55
            color: "transparent"

            ColumnLayout {
                anchors.fill: parent
                spacing: 3
                Layout.alignment: Qt.AlignRight | Qt.AlignTop

                Orbitron {
                    text: "WAYLAND HYPRLAND"
                    size: 8
                    color: Colors.redx70
                    Layout.alignment: Qt.AlignRight || Qt.AlignTop

                }

                RowLayout {
                    spacing: 20
                    Layout.alignment: Qt.AlignRight

                    Repeater {
                        model: Math.min(wsNames.length, wsIcons.length)

                        Rectangle {
                            color: "transparent"
                            height: 20
                            width: wsText.implicitWidth + 12

                            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                            property bool focused: Hyprland.focusedWorkspace?.id === index + 1
                            property bool occupied: ws !== undefined

                            RowLayout {
                                anchors.centerIn: parent
                                spacing: 6

                                Image {
                                    width: 14
                                    height: 14
                                    fillMode: Image.PreserveAspectFit

                                    source: focused
                                        ? hyprPanel.wsIcons[index].active
                                        : occupied
                                            ? hyprPanel.wsIcons[index].occupied
                                            : hyprPanel.wsIcons[index].idle
                                }

                                Rajdhani {
                                    id: wsText
                                    text: hyprPanel.wsNames[index]
                                    size: 14
                                    color: focused ? Colors.whitex : Colors.redx
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: Hyprland.dispatch("workspace " + (index + 1))
                            }
                        }
                    }
                }

            Rajdhani {
                    Layout.alignment: Qt.AlignRight || Qt.AlignTop
                    size: 12
                    color: Colors.greyx

                    text: {
                        const ws = Hyprland.focusedWorkspace
                        if (!ws) return ""

                        const hasWindow = Hyprland.toplevels.values
                            .some(t => t.workspace?.id === ws.id)

                        return hasWindow && Hyprland.activeToplevel
                            ? Hyprland.activeToplevel.title.toUpperCase()
                            : ""
                    }

                }

            }
        }

        Rectangle {
            width:20
            Layout.alignment: Qt.AlignTop
            color: "red"

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
                        width: 20
                        height: 20
                        source: "../assets/icons/hypr-dbus.png"
                    }

                }

            }

        }

        Rectangle {
            width: 15
        }
    }
}
