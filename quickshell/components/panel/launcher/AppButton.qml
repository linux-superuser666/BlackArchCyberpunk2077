import QtMultimedia
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.launcher
import qs.components.typography
import qs.services
import qs.state
import qs.styles

Rectangle {
    id: root

    property string appName: "xxxxxxxxxxxxxxx"
    property string appNameWeight: "medium"
    property color appNameColor: Colors.redx
    property string appType: "xxxxxxxxxxxx"
    property string appCategory: "xxxxxxxxxxxxxxxxx"
    property string appStatus: "IDLE"
    property color appDetailFillColor: Colors.darkbluex80
    property color appDetailStrokeColor: Colors.redx40
    property color appDetailBracketFillColor: Colors.darkbluex80
    property color appDetailBracketStrokeColor: Colors.redx40
    property string appIndicatorStatus: "!"
    property color appIndicatorStatusColor: Colors.blackx
    property color appIndicatorBgColor: Colors.yellow_goldx
    property color appIndicatorBorderColor: Colors.orangex
    property int buttonWidth: 298
    property int buttonHeight: 47

    width: root.buttonWidth
    height: root.buttonHeight
    color: "transparent"

    GridLayout {
        anchors.centerIn: parent
        width: 294
        height: 44
        columns: 3
        columnSpacing: 4
        rowSpacing: 0

        Rectangle {
            id: appIcon

            width: 30
            height: parent.height
            color: "transparent"

            Image {
                width: 19
                height: 48
                anchors.centerIn: parent
                source: "../../../assets/icons/package48.png" //reusable
                fillMode: Image.Stretch
            }

        }

        Rectangle {
            id: appIndicator

            width: 15
            height: 15
            Layout.alignment: Qt.AlignTop
            color: "transparent"

            AppIndicator {
                boxWidth: 11
                boxHeight: 11
                anchors.centerIn: parent
                bgColor: root.appIndicatorBgColor
            }

            AppIndicator {
                boxWidth: 14
                anchors.centerIn: parent
                boxHeight: 14
                borderColor: root.appIndicatorBorderColor
                borderWidth: 1
            }

            Rajdhani {
                anchors.centerIn: parent
                size: Texts.xs
                fontWeight: "bold"
                color: root.appIndicatorStatusColor
                text: root.appIndicatorStatus
            }

        }

        Rectangle {
            Layout.fillWidth: true
            height: parent.height
            color: "transparent"

            RowLayout {
                spacing: 2
                anchors.fill: parent

                Rectangle {
                    width: 8
                    height: parent.height
                    color: "transparent"

                    AppDetailBracket {
                        strokeColor: root.appDetailBracketStrokeColor
                        fillColor: root.appDetailBracketFillColor
                        boxHeight: 47
                        boxWidth: parent.width
                    }

                }

                Rectangle {
                    id: appDetail

                    Layout.fillWidth: true
                    height: parent.height
                    color: "transparent"

                    AppDetailShape {
                        strokeColor: root.appDetailStrokeColor
                        fillColor: root.appDetailFillColor
                        strokeWidth: 1
                    }

                    ColumnLayout {
                        spacing: -1

                        Rajdhani {
                            text: root.appName
                            size: Texts.base
                            pl: 4
                            uppercase: true
                            pt: 3
                            fontWeight: root.appNameWeight
                            color: root.appNameColor
                        }

                        ColumnLayout {
                            spacing: -1

                            Rajdhani {
                                pl: 4
                                text: root.appType
                                size: Texts.xxs
                                fontWeight: "medium"
                                color: Colors.cyanx
                            }

                            Rectangle {
                                width: 220
                                color: "transparent"
                                height: 10
                                clip: true

                                Text {
                                    leftPadding: 4
                                    text: root.appCategory
                                    font.pixelSize: Texts.xxs
                                    elide: Text.ElideRight
                                    wrapMode: Text.NoWrap
                                    font.weight: Font.Medium
                                    color: Colors.greyx
                                }

                            }

                        }

                    }

                }

            }

        }

    }

}
