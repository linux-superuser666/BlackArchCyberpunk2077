import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.state
import qs.styles

Item {
    // ===== UI =====

    id: wifiPanel

    property string ascii: "                                 00\n" + "                                 11\n" + "                                ====\n" + "                                .//\n" + "                               `o//:\n" + "                              `+o//o:\n" + "                             `+oo//oo:\n" + "                             -+oo//oo+:\n" + "                           `/:-:+//ooo+:\n" + "                          `/+++++//+++++:\n" + "                         `/++++++//++++++:\n" + "                        `/+++oooo//ooooooo/`\n" + "                       ./ooosssso//osssssso+`\n" + "                      .oossssso-`//`/ossssss+`\n" + "                     -osssssso.  //  :ssssssso.\n" + "                    :osssssss/   //   osssso+++.\n" + "                   /ossssssss/   //   +ssssooo/-\n" + "                 `/ossssso+/:-   //   -:/+osssso+-\n" + "                `+sso+:-`        //       `.-/+oso:\n" + "               `++:.             //            `-/+/\n" + "               .`                /                `/"

    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    focus: false

    Rectangle {
        id: root

        color: "transparent"
        implicitWidth: 330
        implicitHeight: 400

        RowLayout {
            anchors.fill: parent
            spacing: 4

            // ===== MAIN CONTENT =====
            Item {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop

                ColumnLayout {
                    anchors.right: parent.right
                    spacing: 5

                    Rectangle {
                        color: "transparent"
                        Layout.preferredWidth: 125
                        Layout.preferredHeight: 10
                        Layout.alignment: Qt.AlignRight

                        Text {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            text: "CONNECTION_D-BUS_1.001.1"
                            color: "#f75049"
                            font.family: "Orbitron"
                            font.pixelSize: 8
                            font.bold: true
                        }

                    }

                    Rectangle {
                        color: "transparent"
                        width: 290
                        Layout.preferredHeight: 380 + 2
                        anchors.margins: 5

                        RowLayout {
                            spacing: 0

                            Image {
                                Layout.preferredWidth: 28
                                Layout.preferredHeight: 380
                                fillMode: Image.PreserveAspectFit
                                source: "../assets/images/users/user-panelleft.png"
                            }

                            Rectangle {
                                color: "transparent"
                                Layout.preferredWidth: 266
                                Layout.preferredHeight: 380

                                Image {
                                    Layout.preferredWidth: 266
                                    Layout.preferredHeight: 380
                                    fillMode: Image.PreserveAspectFit
                                    source: "../assets/images/users/user-panelright.png"
                                }

                                RowLayout {
                                    Rectangle {
                                        width: 3
                                    }

                                    ColumnLayout {
                                        spacing: 4

                                        Rectangle {
                                            height: 1
                                        }

                                        Rectangle {
                                            width: 250
                                            height: 15
                                            color: "transparent"

                                            RowLayout {
                                                anchors.fill: parent

                                                Text {
                                                    text: "SUPERUSER"
                                                    color: "#f75049"
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 14
                                                    font.weight: Font.DemiBold
                                                }

                                                Item {
                                                    Layout.fillWidth: true // ✅ BENAR
                                                }

                                                Text {
                                                    text: "ACCESS GRANTED"
                                                    color: Colors.redx40
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 9
                                                    font.weight: Font.DemiBold
                                                }

                                            }

                                        }

                                        BorderXRed40 {
                                            lineWidth: 250
                                        }

                                        Text {
                                            color: Colors.whitex
                                            font.family: "Rajdhani"
                                            font.pixelSize: 16
                                            font.bold: true
                                            text: "mrnngstr666"
                                        }

                                        Rectangle {
                                            width: 250
                                            height: 15
                                            color: "transparent"

                                            RowLayout {
                                                anchors.fill: parent

                                                Text {
                                                    text: "EQUIPMENT"
                                                    color: "#f75049"
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 14
                                                    font.weight: Font.DemiBold
                                                }

                                                Item {
                                                    Layout.fillWidth: true // ✅ BENAR
                                                }

                                                Text {
                                                    text: "ACCESS GRANTED"
                                                    color: Colors.redx40
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 9
                                                    font.weight: Font.DemiBold
                                                }

                                            }

                                        }

                                        BorderXRed40 {
                                            lineWidth: 250
                                        }

                                        RowLayout {
                                            spacing: 0

                                            Rectangle {
                                                width: 180
                                                height: 120
                                                color: "transparent"

                                                ColumnLayout {
                                                    spacing: 1

                                                    Text {
                                                        text: "MANUFACTURER"
                                                        color: Colors.yellow_goldx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "ASUSTeK COMPUTER INC."
                                                        color: Colors.greyx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "MODEL"
                                                        color: Colors.yellow_goldx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "X201EV"
                                                        color: Colors.greyx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "CPU"
                                                        color: Colors.yellow_goldx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "Intel Celeron 1007U (2) @ 1.500GHz "
                                                        color: Colors.greyx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "GPU"
                                                        color: Colors.yellow_goldx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                    Text {
                                                        text: "Intel VivoBook X202EV"
                                                        color: Colors.greyx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 10
                                                        font.weight: Font.DemiBold
                                                    }

                                                }

                                            }

                                            Rectangle {
                                                width: 100
                                                height: 120
                                                color: "transparent"
                                            }

                                        }

                                        Rectangle {
                                            width: 250
                                            height: 15
                                            color: "transparent"

                                            RowLayout {
                                                anchors.fill: parent

                                                Text {
                                                    text: "DATA FETCHING"
                                                    color: "#f75049"
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 14
                                                    font.weight: Font.DemiBold
                                                }

                                                Item {
                                                    Layout.fillWidth: true
                                                }

                                                Text {
                                                    text: "ACCESS GRANTED"
                                                    color: Colors.redx40
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 9
                                                    font.weight: Font.DemiBold
                                                }

                                            }

                                        }

                                        BorderXRed40 {
                                            lineWidth: 250
                                        }

                                        RowLayout {
                                            spacing: 0

                                            Rectangle {
                                                width: 120
                                                height: 120
                                                color: "transparent"

                                                ColumnLayout {
                                                    RowLayout {
                                                        Image {
                                                            Layout.preferredWidth: 28
                                                            Layout.preferredHeight: 24
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/icons/contoh.png"
                                                        }

                                                        Text {
                                                            text: "BLACKARCH"
                                                            color: Colors.greyx
                                                            font.family: "Rajdhani"
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                        }

                                                    }

                                                    RowLayout {
                                                        Image {
                                                            Layout.preferredWidth: 28
                                                            Layout.preferredHeight: 24
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/icons/contoh.png"
                                                        }

                                                        Text {
                                                            text: "6.18.2-arch2-1 "
                                                            color: Colors.greyx
                                                            font.family: "Rajdhani"
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                        }

                                                    }

                                                    RowLayout {
                                                        Image {
                                                            Layout.preferredWidth: 28
                                                            Layout.preferredHeight: 24
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/icons/contoh.png"
                                                        }

                                                        Text {
                                                            text: "2267 (pacman)"
                                                            color: Colors.greyx
                                                            font.family: "Rajdhani"
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                        }

                                                    }

                                                    RowLayout {
                                                        Image {
                                                            Layout.preferredWidth: 28
                                                            Layout.preferredHeight: 24
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/icons/contoh.png"
                                                        }

                                                        Text {
                                                            text: "Wayland"
                                                            color: Colors.greyx
                                                            font.family: "Rajdhani"
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                        }

                                                    }

                                                    RowLayout {
                                                        Image {
                                                            Layout.preferredWidth: 28
                                                            Layout.preferredHeight: 24
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/icons/contoh.png"
                                                        }

                                                        Text {
                                                            text: "Hyprland"
                                                            color: Colors.greyx
                                                            font.family: "Rajdhani"
                                                            font.pixelSize: 12
                                                            font.weight: Font.DemiBold
                                                        }

                                                    }

                                                }

                                            }

                                            Rectangle {
                                                id: blackarch

                                                width: 130
                                                height: 140
                                                color: "transparent"
                                                clip: true

                                                Text {
                                                    anchors.centerIn: parent
                                                    anchors.margins: 4
                                                    text: ascii
                                                    color: "white"
                                                    font.family: "monospace"
                                                    font.pixelSize: 4
                                                    wrapMode: Text.NoWrap
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

            // ===== SIDE BAR =====
            Rectangle {
                Layout.preferredWidth: 30
                Layout.alignment: Qt.AlignTop
                color: "transparent"

                ColumnLayout {
                    spacing: 12

                    BinLines {
                    }

                    Image {
                        Layout.preferredWidth: 28
                        Layout.preferredHeight: 24
                        fillMode: Image.PreserveAspectFit
                        source: "../assets/icons/hypr-dbus.png"
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: GlobalState.closeNetwork()
                }

            }

        }

    }

}
