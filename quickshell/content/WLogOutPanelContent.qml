import QtMultimedia
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
    height: 320
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            spacing: 4
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Rectangle {
            width: 300
            height: 320
            color: "transparent"

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 3

                BorderXRed40 {
                    lineWidth: 1
                }

                Rectangle {
                    width: 290
                    height: 144
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

                RowLayout {
                    spacing: 10

                    SysImgText {
                        size: 6
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

                            keyText: "esc"
                            labelText: "CLose"
                        }

                    }

                }

            }

        }

    }

}
