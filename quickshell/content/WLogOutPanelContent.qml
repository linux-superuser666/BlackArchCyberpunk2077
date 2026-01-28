import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.components.common
import qs.components.panel.wlogout
import qs.components.typography
import qs.content
import qs.scripts
import qs.state
import qs.styles

Rectangle {
    id: root

    width: 310
    height: 300
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            spacing: 4
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            BinLinesState {
            }

            Image {
                source: "../assets/icons/panel/hardware-icon.png"
                width: 20
                height: 20
                fillMode: Image.PreserveAspectFit

                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    running: GlobalState.launcherActive && root.visible

                    NumberAnimation {
                        from: 1
                        to: 0
                        duration: 1000
                    }

                    NumberAnimation {
                        from: 0
                        to: 1
                        duration: 1000
                    }

                }

            }

        }

        Rectangle {
            width: 290
            height: 300
            color: "transparent"

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 3

                Orbitron {
                    text: "CONNECTION_D-BUS 1.001.1"
                    size: 8
                    color: Colors.redx70
                }

                Rajdhani {
                    text: "wlogout"
                    size: Texts.sm
                    uppercase: true
                    color: Colors.greyx
                    fontWeight: "medium"
                }

                BorderXRed40 {
                    lineWidth: 270
                }

                Rajdhani {
                    text: "wayland"
                    size: Texts.xxxs
                    uppercase: true
                    color: Colors.redx
                    fontWeight: "medium"
                }

                Rectangle {
                    width: 290
                    height: 300
                    color: "transparent"

                    WLogout {
                        LogoutButton {
                            command: "loginctl lock-session"
                            keybind: Qt.Key_K
                            text: "Lock"
                            icon: "lock"
                        }

                        LogoutButton {
                            command: "loginctl terminate-user $USER"
                            keybind: Qt.Key_E
                            text: "Logout"
                            icon: "logout"
                        }

                        LogoutButton {
                            command: "systemctl suspend"
                            keybind: Qt.Key_U
                            text: "Suspend"
                            icon: "suspend"
                        }

                        LogoutButton {
                            command: "systemctl hibernate"
                            keybind: Qt.Key_H
                            text: "Hibernate"
                            icon: "hibernate"
                        }

                        LogoutButton {
                            command: "systemctl poweroff"
                            keybind: Qt.Key_K
                            text: "Shutdown"
                            icon: "shutdown"
                        }

                        LogoutButton {
                            command: "systemctl reboot"
                            keybind: Qt.Key_R
                            text: "Reboot"
                            icon: "reboot"
                        }

                    }

                }

                BorderXRed40 {
                    lineWidth: 298
                }

                RowLayout {
                    spacing: 10

                    SysImgText {
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        width: radioStop.implicitWidth
                        height: radioStop.implicitHeight
                        color: "transparent"

                        PanelActionOutLabel {
                            id: radioStop

                            keyText: "󰌑"
                            labelText: "LAUNCH"
                        }

                    }

                    Rectangle {
                        width: radioExit.implicitWidth
                        height: radioExit.implicitHeight
                        color: "transparent"

                        PanelActionOutLabel {
                            id: radioExit

                            keyText: "C"
                            labelText: "CLose"
                        }

                    }

                }

            }

        }

    }

}
