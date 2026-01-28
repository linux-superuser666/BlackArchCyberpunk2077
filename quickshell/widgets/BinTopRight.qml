import QtQuick
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.state
import qs.styles as Styles

PanelWindow {
    required property var screen
    property var binData: ["10011", "11001", "01110", "11010"]
    property var lines: ["", "", "", ""]

    function randomBin() {
        return binData[Math.floor(Math.random() * binData.length)];
    }

    WlrLayershell.layer: WlrLayer.Top
    screen: screen
    implicitHeight: 260
    implicitWidth: 40
    color: "transparent"

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            for (let i = 0; i < lines.length; i++) {
                lines[i] = randomBin();
            }
            lines = lines.slice();
        }
    }

    anchors {
        right: true
        top: true
    }

    ColumnLayout {
        spacing: 5

        Rectangle {
            height: 130
        }

        Rectangle {
            height: 5
            width: 45
            color: "transparent"

            Text {
                id: lines1

                text: "-"
                color: Styles.Colors.redx
                font.pixelSize: 12
                font.family: "Rajdhani"
                font.bold: true
            }

            SequentialAnimation {
                loops: Animation.Infinite
                running: true

                ParallelAnimation {
                    PropertyAnimation {
                        target: lines1
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }

                }

                ParallelAnimation {
                    PropertyAnimation {
                        target: lines1
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }

                }

            }

        }

        Rectangle {
            id: binTopRight

            height: 100
            width: 45
            color: "transparent"

            MouseArea {
                anchors.fill: binTopRight
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    GlobalState.toggleSuperUser();
                }
            }

            ColumnLayout {
                anchors.left: parent.left
                spacing: 5

                Rectangle {
                    height: 40
                    width: 45
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 4
                        spacing: -3

                        Repeater {
                            model: lines.length

                            Text {
                                text: lines[index]
                                color: Styles.Colors.redx
                                font.pixelSize: 8
                                font.family: "Rajdhani"
                                font.bold: true
                            }

                        }

                    }

                }

                Rectangle {
                    height: 5
                    width: 45
                    color: "transparent"

                    Text {
                        id: lines2

                        text: "-"
                        color: Styles.Colors.redx
                        font.pixelSize: 12
                        font.family: "Rajdhani"
                        font.bold: true
                    }

                    SequentialAnimation {
                        loops: Animation.Infinite
                        running: true

                        ParallelAnimation {
                            PropertyAnimation {
                                target: lines2
                                property: "opacity"
                                from: 1
                                to: 0
                                duration: 1000
                                easing.type: Easing.InOutQuad
                            }

                        }

                        ParallelAnimation {
                            PropertyAnimation {
                                target: lines2
                                property: "opacity"
                                from: 0
                                to: 1
                                duration: 1000
                                easing.type: Easing.InOutQuad
                            }

                        }

                    }

                }

                Rectangle {
                    height: 40
                    width: 45
                    color: "transparent"

                    Column {
                        anchors.fill: parent
                        anchors.margins: 4
                        spacing: -3

                        Repeater {
                            model: lines.length

                            Text {
                                text: lines[index]
                                color: Styles.Colors.redx
                                font.pixelSize: 8
                                font.family: "Rajdhani"
                                font.bold: true
                            }

                        }

                    }

                }

            }

        }

        Rectangle {
            height: 5
            width: 45
            color: "transparent"

            Text {
                id: lines3

                text: "-"
                color: Styles.Colors.redx
                font.pixelSize: 12
                font.family: "Rajdhani"
                font.bold: true
            }

            SequentialAnimation {
                loops: Animation.Infinite
                running: true

                ParallelAnimation {
                    PropertyAnimation {
                        target: lines3
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }

                }

                ParallelAnimation {
                    PropertyAnimation {
                        target: lines3
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

}
