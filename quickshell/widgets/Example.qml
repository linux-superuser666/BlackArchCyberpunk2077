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
import qs.components.panel.system
import qs.components.typography
import qs.services
import qs.state
import qs.styles

PanelWindow {
    color: "transparent"
    screen: screen
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: 600
    implicitHeight: 65

    anchors {
        left: true
        top: true
    }

    RowLayout {
        spacing: 0

        Rectangle {
            //spacingleft
            width: 60
        }

        Rectangle {
            //content
            id: root

            color: "transparent"
            width: 298
            height: 47

            Rectangle {
                height: 40
                color: "transparent"
                width: 292

                RowLayout {
                    anchors.fill: parent
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0

                    ColumnLayout {
                        spacing: 0
                        Layout.fillHeight: true

                        Rectangle {
                            width: 4
                            height: 4
                            color: "transparent"

                            LauncherHighlight {
                            }

                        }

                        FillY {
                        }

                        Rectangle {
                            width: 4
                            height: 4
                            color: "transparent"

                            LauncherHighlight {
                                rotation: -90
                                transformOrigin: Item.Center
                            }

                        }

                    }

                    FillX {
                    }

                    ColumnLayout {
                        spacing: 0
                        Layout.fillHeight: true

                        Rectangle {
                            width: 4
                            height: 4
                            color: "transparent"

                            LauncherHighlight {
                                rotation: 90
                                transformOrigin: Item.Center
                            }

                        }

                        FillY {
                        }

                        Rectangle {
                            width: 4
                            height: 4
                            color: "transparent"

                            LauncherHighlight {
                                rotation: 180
                                transformOrigin: Item.Center
                            }

                        }

                    }

                }

            }

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
                        source: "../assets/icons/package48.png"
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
                        bgColor: Colors.yellow_goldx
                    }

                    AppIndicator {
                        boxWidth: 14
                        anchors.centerIn: parent
                        boxHeight: 14
                        borderColor: Colors.orangex
                        borderWidth: 1
                    }

                    Rajdhani {
                        anchors.centerIn: parent
                        size: Texts.xs
                        fontWeight: "bold"
                        color: Colors.blackx
                        text: "!"
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
                                fillColor: Colors.darkbluex80
                                strokeColor: Colors.redx40
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
                                strokeColor: Colors.redx40
                                fillColor: Colors.darkbluex80
                                strokeWidth: 1
                            }

                            ColumnLayout {
                                spacing: -1

                                Rajdhani {
                                    text: "appName"
                                    size: Texts.base
                                    pl: 4
                                    uppercase: true
                                    pt: 3
                                    fontWeight: "medium"
                                    color: Colors.redx
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 0

                                    ColumnLayout {
                                        spacing: -1

                                        Rajdhani {
                                            pl: 4
                                            text: "appType"
                                            size: Texts.xxs
                                            color: Colors.redx
                                        }

                                        Rajdhani {
                                            pl: 4
                                            text: "appCategory"
                                            size: Texts.xxs
                                            color: Colors.redx
                                        }

                                    }

                                    Rectangle {
                                        width: 100
                                    }

                                    Rajdhani {
                                        pl: 4
                                        text: "IDLE"
                                        size: Texts.xxs
                                        color: Colors.redx
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
