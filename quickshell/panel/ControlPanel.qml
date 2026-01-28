import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.control
import qs.components.typography
import qs.popup
import qs.services
import qs.state
import qs.styles

PanelWindow {
    id: root

    required property var screen
    property var modelData

    function showShowTerm() {
        termUpdate.running = true;
    }

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: 300
    implicitHeight: 60

    PacmanSync {
        id: updates

        onUpdated: function(count) {
            console.log("UPDATE COUNT:", count);
            updateCount.text = count;
        }
    }

    Process {
        id: termUpdate

        running: false
        command: ["kitty", "--title", "pacman update", "bash", "-lc", "sudo pacman -Syu"]
    }

    anchors {
        bottom: true
        left: true
    }

    RowLayout {
        spacing: 0
        anchors.fill: parent
        anchors.margins: 0

        Rectangle {
            color: "transparent"
            width: 20
            height: 50
        }

        Rectangle {
            id: originLeft

            color: "transparent"
            width: 300
            height: 50

            RowLayout {
                anchors.fill: parent
                spacing: 2

                Rectangle {
                    Layout.preferredWidth: 25
                    Layout.alignment: Qt.AlignTop
                    color: "transparent"

                    ColumnLayout {
                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.verticalCenter: parent.verticalCenter
                        spacing: 4

                        Rectangle {
                            width: 25
                            height: 25
                            color: "transparent"

                            BinLines {
                            }

                        }

                        Rectangle {
                            width: 25
                            height: 14
                            color: "transparent"

                            Image {
                                id: originDbusIcon

                                width: 20
                                height: 20
                                source: "../assets/icons/origin-dbus-icon.png"
                                fillMode: Image.PreserveAspectFit
                            }

                        }

                    }

                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5

                        Rectangle {
                            height: 5

                            Orbitron {
                                size: 8
                                color: Colors.redx70
                                uppercase: true
                                text: "connection 201.894.33"
                            }

                        }
                        // ⬅️ CONTENT

                        Rectangle {
                            width: 180
                            height: 40
                            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                            color: "transparent"

                            RowLayout {
                                spacing: 4

                                Rectangle {
                                    width: 40
                                    height: 43
                                    color: "transparent"

                                    ControlIconBox {
                                        width: 40
                                        bgColor: Colors.redx10
                                        height: 40
                                        borderWidth: 2
                                    }

                                    Rectangle {
                                        width: 40
                                        color: "transparent"
                                        height: 41
                                        anchors.centerIn: parent

                                        Image {
                                            id: mailBoxIcon

                                            anchors.centerIn: parent
                                            width: 28
                                            height: 32
                                            source: "../assets/icons/package48.png"
                                            fillMode: Image.PreserveAspectFit
                                        }

                                        RowLayout {
                                            spacing: 15
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter

                                            Rectangle {
                                                width: 35
                                                color: "transparent"
                                                height: 30

                                                Text {
                                                    id: updateCount

                                                    text: updates.count
                                                    font.weight: Font.DemiBold
                                                    font.family: "Rajdhani"
                                                    anchors.right: parent.right
                                                    color: Colors.orangex
                                                    font.pixelSize: 8
                                                    visible: text !== "0"
                                                }

                                            }

                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                updates.refresh();
                                                showShowTerm();
                                            }
                                        }

                                    }

                                }

                                Rectangle {
                                    width: 40
                                    height: 41
                                    color: "transparent"

                                    ControlIconBox {
                                        width: 40
                                        height: 40
                                        bgColor: Colors.redx10
                                        borderWidth: 2
                                    }

                                    Rectangle {
                                        width: 40
                                        color: "transparent"
                                        height: 41
                                        anchors.centerIn: parent

                                        Image {
                                            id: systemBoxIcon

                                            anchors.centerIn: parent
                                            width: 24
                                            height: 25
                                            source: "../assets/icons/origin-system.png"
                                            fillMode: Image.PreserveAspectFit
                                        }

                                        RowLayout {
                                            spacing: 15
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter

                                            Rectangle {
                                                width: 33
                                                color: "transparent"
                                                height: 30

                                                Text {
                                                    id: systemIconSymbl

                                                    text: "󰫅"
                                                    anchors.right: parent.right
                                                    font.weight: Font.DemiBold
                                                    font.family: "Rajdhani"
                                                    color: Colors.whitex
                                                    font.pixelSize: 8
                                                }

                                                SequentialAnimation {
                                                    loops: Animation.Infinite
                                                    running: true

                                                    ParallelAnimation {
                                                        PropertyAnimation {
                                                            target: systemIconSymbl
                                                            property: "opacity"
                                                            from: 1
                                                            to: 0
                                                            duration: 1000
                                                            easing.type: Easing.InOutQuad
                                                        }

                                                    }

                                                    ParallelAnimation {
                                                        PropertyAnimation {
                                                            target: systemIconSymbl
                                                            property: "opacity"
                                                            from: 0
                                                            to: 1
                                                            duration: 1000
                                                            easing.type: Easing.InOutQuad
                                                        }

                                                    }

                                                }

                                            }

                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                GlobalState.toggleLevel();
                                            }
                                        }

                                    }

                                }

                                Rectangle {
                                    width: 40
                                    height: 41
                                    color: "transparent"

                                    ControlIconBox {
                                        width: 40
                                        height: 40
                                        bgColor: Colors.redx10
                                        borderWidth: 2
                                    }

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: 40
                                        color: "transparent"
                                        height: 41

                                        ColumnLayout {
                                            spacing: 0

                                            RadioBar {
                                            }

                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            GlobalState.toggleRadioStation();
                                        }
                                    }

                                }

                                Rectangle {
                                    width: 40
                                    height: 41
                                    color: "transparent"

                                    ControlIconBox {
                                        width: 40
                                        height: 40
                                        bgColor: Colors.redx10
                                        borderWidth: 2
                                    }

                                    NetIcon {
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onEntered: GlobalState.showNetPopup()
                                        onExited: GlobalState.hideNetPopup()
                                        onClicked: {
                                            GlobalState.toggleNetwork();
                                        }
                                    }

                                }

                                Rectangle {
                                    //MouseArea {
                                    //    anchors.fill: parent
                                    //    cursorShape: Qt.PointingHandCursor
                                    //    hoverEnabled: true
                                    //    onEntered: GlobalState.showNetPopup()
                                    //    onExited: GlobalState.hideNetPopup()
                                    //    onClicked: {
                                    //        GlobalState.toggleNetwork();
                                    //    }
                                    //}

                                    width: 40
                                    height: 41
                                    color: "transparent"

                                    Rajdhani {
                                        text: "icon disk"
                                    }

                                    ControlIconBox {
                                        width: 40
                                        height: 40
                                        bgColor: Colors.redx10
                                        borderWidth: 2
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
