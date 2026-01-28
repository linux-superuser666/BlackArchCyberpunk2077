import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.typography
import qs.styles

PanelWindow {
    id: chronoPanel

    required property var screen
    property string uptimeText: "--:--:--"

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: 170
    implicitHeight: 60

    Timer {
        id: uptimeTimer

        interval: 1000
        repeat: true
        running: timeTxt.mode === 2
        onTriggered: uptimeProc.running = true
    }

    Connections {
        function onModeChanged() {
            if (timeTxt.mode === 2)
                uptimeProc.running = true;
            else
                uptimeProc.running = false;
        }

        target: timeTxt
    }

    Process {
        id: uptimeProc

        command: ["sh", "-c", "awk '{ t=$1; printf \"%02d:%02d:%02d\", int(t/3600), int(t%3600/60), int(t%60) }' /proc/uptime"]
        running: uptimeTimer.running

        stdout: SplitParser {
            onRead: (line) => {
                return uptimeText = line.trim();
            }
        }

    }

    SystemClock {
        id: clock

        precision: SystemClock.Seconds
    }

    anchors {
        right: true
        bottom: true
    }

    RowLayout {
        spacing: 0
        anchors.fill: parent
        anchors.margins: 0
        Layout.fillWidth: true

        Rectangle {
            id: choroRight

            color: "transparent"
            Layout.fillWidth: true
            height: 50

            RowLayout {
                anchors.fill: parent
                spacing: 5

                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignRight
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5

                        Orbitron {
                            size: 8
                            color: Colors.redx70
                            Layout.alignment: Qt.AlignTop | Qt.AlignRight
                            text: "CHRONO_PANEL 1.001.1"
                        }
                        // ⬅️ CONTENT

                        Rectangle {
                            height: 42
                            width: 93
                            Layout.alignment: Qt.AlignTop | Qt.AlignRight
                            color: "transparent"

                            RowLayout {
                                spacing: 4

                                Rectangle {
                                    width: 93
                                    height: 30
                                    color: "transparent"
                                    Layout.alignment: Qt.AlignRight

                                    Rectangle {
                                        width: 70
                                        height: 41
                                        anchors.centerIn: parent
                                        color: "transparent"

                                        ColumnLayout {
                                            spacing: 0
                                            height: 41

                                            RowLayout {
                                                spacing: 0
                                                width: 70

                                                Orbitron {
                                                    text: "10110101"
                                                    size: 3
                                                }

                                                Rectangle {
                                                    width: 43
                                                }

                                                Orbitron {
                                                    text: "10110101"
                                                    size: 3
                                                }

                                            }

                                            FillY {
                                            }

                                            RowLayout {
                                                spacing: 0
                                                width: 70

                                                Orbitron {
                                                    text: "10110101"
                                                    size: 3
                                                }

                                                Rectangle {
                                                    width: 43
                                                }

                                                Orbitron {
                                                    text: "10110101"
                                                    size: 3
                                                }

                                            }

                                        }

                                    }

                                    Rectangle {
                                        id: timeFrame

                                        width: 90
                                        height: 16
                                        anchors.centerIn: parent
                                        color: "transparent"

                                        RowLayout {
                                            spacing: 0
                                            width: 90

                                            Rectangle {
                                                width: 6
                                                radius: 1
                                                height: 10
                                                color: Colors.redx70
                                            }

                                            FillX {
                                            }

                                            Rectangle {
                                                width: 6
                                                radius: 1
                                                height: 10
                                                color: Colors.redx70
                                            }

                                        }

                                    }

                                    Rectangle {
                                        radius: 3
                                        width: 73
                                        height: 33
                                        color: Colors.redx70
                                        anchors.centerIn: parent
                                    }

                                    Text {
                                        id: timeTxt

                                        property int mode: 0

                                        anchors.centerIn: parent
                                        font.pixelSize: 17
                                        font.family: "DS-Digital"
                                        font.bold: true
                                        color: Colors.cyanx
                                        text: mode === 0 ? Qt.formatDateTime(clock.date, clock.seconds % 2 === 0 ? "hh mm AP" : "hh:mm AP") : mode === 1 ? Qt.formatDateTime(clock.date, "dd-MM-yy") : uptimeText

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                timeTxt.mode = (timeTxt.mode + 1) % 3;
                                            }
                                        }

                                    }

                                    SequentialAnimation {
                                        loops: Animation.Infinite
                                        running: true

                                        ParallelAnimation {
                                            PropertyAnimation {
                                                target: timeFrame
                                                property: "opacity"
                                                from: 1
                                                to: 0
                                                duration: 1000
                                                easing.type: Easing.InOutQuad
                                            }

                                        }

                                        ParallelAnimation {
                                            PropertyAnimation {
                                                target: timeFrame
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

                    }

                }

                Rectangle {
                    Layout.preferredWidth: 25
                    Layout.alignment: Qt.AlignTop | Qt.AlignRight
                    color: "transparent"

                    ColumnLayout {
                        spacing: 10

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

            }

        }

        Rectangle {
            color: "transparent"
            width: 15
            height: 50
        }

    }

}
