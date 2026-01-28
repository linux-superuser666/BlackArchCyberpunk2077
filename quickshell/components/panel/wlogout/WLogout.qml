import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.components.panel.wlogout
import qs.styles

Rectangle {
    id: root

    default property list<LogoutButton> buttons

    width: 270
    height: 142
    color: "transparent"

    RowLayout {
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            width: 24
            color: "transparent"
            height: 142

            WlogoutBracket {
                boxHeight: parent.height
                boxWidth: parent.width
                borderWidth: 1
                borderColor: Colors.redx80
                gradStart: Colors.redx40
                gradEnd: Colors.redx70
            }

        }

        Rectangle {
            color: "transparent"
            width: 246
            height: 142

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()

                GridLayout {
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    columns: 3
                    columnSpacing: 0
                    rowSpacing: 0

                    Repeater {
                        model: buttons

                        delegate: Rectangle {
                            required property LogoutButton modelData

                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "transparent"
                            border.color: "transparent"
                            border.width: ma.containsMouse ? 0 : 0

                            RowLayout {
                                spacing: 2

                                Rectangle {
                                    width: 10
                                    height: 70
                                    color: "transparent"

                                    WlogoutButtonBracket {
                                        gradStart: Colors.redx40
                                        gradEnd: Colors.redx80
                                        strokeColor: Colors.redx80
                                        strokeWidth: 1
                                        boxWidth: parent.width
                                        boxHeight: parent.height
                                    }

                                }

                                Rectangle {
                                    width: 67
                                    height: 70
                                    color: "transparent"

                                    WlogoutButtons {
                                        boxWidth: parent.width
                                        boxHeight: parent.height
                                        bgColor: ma.containsMouse ? Colors.redx70 : Colors.darkbluex80
                                        borderColor: Colors.redx80
                                        borderWidth: 1
                                    }

                                }

                            }

                            MouseArea {
                                id: ma

                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: modelData.exec()
                            }

                            Image {
                                id: icon

                                anchors.centerIn: parent
                                source: `../../../assets/icons/power/${modelData.icon}.png`
                                width: parent.width * 0.3
                                height: parent.width * 0.3
                            }

                            Text {
                                text: modelData.text
                                font.pointSize: Texts.xxs
                                font.weight: Font.Medium
                                font.family: "Rajdhani"
                                color: "white"

                                anchors {
                                    top: icon.bottom
                                    topMargin: 1
                                    horizontalCenter: parent.horizontalCenter
                                }

                            }

                        }

                    }

                }

            }

        }

    }

}
