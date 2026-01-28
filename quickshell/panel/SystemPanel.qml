import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.system
import qs.components.typography
import qs.services
import qs.state
import qs.styles

PanelWindow {
    id: systemPanel

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: 400
    implicitHeight: 65

    anchors {
        left: true
        top: true
    }

    Cpu {
        id: cpu
    }

    Ram {
        id: ram
    }

    Swap {
        id: swap
    }

    Storage {
        id: disk
    }

    RowLayout {
        spacing: 0

        Rectangle {
            color: "transparent"
            width: 20
            height: 40
        }

        Rectangle {
            color: "transparent"
            width: 300
            height: 40

            ColumnLayout {
                id: batteryContentColumn

                spacing: 0
                anchors.left: parent.left

                Rectangle {
                    ColumnLayout {
                        spacing: 10
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                        Rectangle {
                            id: panelSystem

                            color: "transparent"
                            width: 300
                            height: 290

                            RowLayout {
                                anchors.fill: parent
                                spacing: 5

                                Rectangle {
                                    Layout.preferredWidth: 20
                                    Layout.alignment: Qt.AlignTop
                                    color: "transparent"

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
                                                width: 17
                                                height: 17
                                                source: "../assets/icons/panel/system-icon-alt.png"
                                                fillMode: Image.PreserveAspectFit
                                            }

                                        }

                                        Rectangle {
                                            width: 10
                                            height: 10
                                            color: "transparent"
                                            Layout.alignment: Qt.AlignRight | Qt.AlignTop

                                            Image {
                                                width: 8
                                                height: 11
                                                source: "../assets/icons/panel/lightning.png"
                                                fillMode: Image.PreserveAspectFit
                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignTop
                                    color: "transparent"

                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 1

                                        Orbitron {
                                            text: "SYSTEM_PANEL 1.001.1"
                                            size: 8
                                            color: Colors.redx70
                                            uppercase: true
                                        }
                                        // ⬅️ CONTENT

                                        Rectangle {
                                            width: 300
                                            height: 35
                                            Layout.fillWidth: true
                                            Layout.alignment: Qt.AlignTop
                                            color: "transparent"

                                            RowLayout {
                                                spacing: 4

                                                Rectangle {
                                                    color: "transparent"
                                                    width: 33
                                                    height: 35
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                                                    CpuDigBox {
                                                        z: 1
                                                        anchors.centerIn: parent
                                                        boxWidth: 25
                                                        boxHeight: 25
                                                        borderColor: Colors.blackx
                                                        bgColor: Colors.greyx
                                                    }

                                                    CpuDigBox {
                                                        z: 0
                                                        anchors.centerIn: parent
                                                        boxWidth: 29
                                                        boxHeight: 31
                                                        borderColor: Colors.greyx
                                                    }

                                                    Text {
                                                        id: cpuPercentAvg

                                                        z: 2
                                                        anchors.centerIn: parent
                                                        text: cpu.cpuUse
                                                        color: Colors.darkbluex
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 15
                                                        font.bold: true
                                                    }

                                                }

                                                Rectangle {
                                                    height: 40

                                                    ColumnLayout {
                                                        spacing: 3

                                                        Rectangle {
                                                            id: cpuMinMAX

                                                            color: "transparent"
                                                            width: 150
                                                            height: 3

                                                            ColumnLayout {
                                                                spacing: -3

                                                                Rectangle {
                                                                    id: cpuMin

                                                                    color: Colors.cpu_minmax_bg
                                                                    width: 150
                                                                    height: 3
                                                                }

                                                                Rectangle {
                                                                    id: cpuMAX

                                                                    width: 150 * (cpu.cpuUse / 100)
                                                                    color: Colors.cpu_minmax_fg
                                                                    height: 3
                                                                }

                                                            }

                                                        }

                                                        Rectangle {
                                                            id: cpuAvgBar

                                                            color: "transparent"
                                                            width: 150
                                                            height: 8

                                                            ColumnLayout {
                                                                spacing: -8

                                                                CpuBar {
                                                                    id: cpuAvgBg

                                                                    fillColor: Colors.redx40
                                                                    boxWidth: 150
                                                                    boxHeight: 8
                                                                }

                                                                Rectangle {
                                                                    id: cpuAvgFg

                                                                    width: 150 * (cpu.cpuUse / 100)
                                                                    color: Colors.cpu_avg_fg
                                                                    height: 8
                                                                }

                                                            }

                                                        }

                                                        Rectangle {
                                                            height: 14

                                                            ColumnLayout {
                                                                spacing: -14

                                                                Rectangle {
                                                                    id: ramBarUsingPng

                                                                    color: "transparent"
                                                                    width: 150
                                                                    height: 14

                                                                    RowLayout {
                                                                        spacing: 2

                                                                        Repeater {
                                                                            model: 10

                                                                            Image {
                                                                                width: 12
                                                                                height: 14
                                                                                fillMode: Image.PreserveAspectFit
                                                                                source: index < ram.ramSlotsUsed ? "../assets/icons/ram-fg.png" : "../assets/icons/ram-bg.png"
                                                                            }

                                                                        }

                                                                    }

                                                                }

                                                                Rectangle {
                                                                    id: swapBarUsingPng

                                                                    color: "transparent"
                                                                    width: 150
                                                                    height: 14

                                                                    RowLayout {
                                                                        spacing: 2

                                                                        Repeater {
                                                                            model: 10

                                                                            Image {
                                                                                width: 12
                                                                                height: 14
                                                                                fillMode: Image.PreserveAspectFit
                                                                                source: "../assets/icons/swap-fg.png"
                                                                                visible: index < swap.swapSlotsUsed
                                                                            }

                                                                        }

                                                                    }

                                                                }

                                                            }

                                                        }

                                                    }

                                                }

                                                Rectangle {
                                                    width: 150
                                                }

                                                Rajdhani {
                                                    Layout.alignment: Qt.AlignTop
                                                    text: ram.ramUse
                                                    size: 20
                                                    fontWeight: "medium"
                                                }

                                                Rajdhani {
                                                    text: ram.totalRam
                                                    Layout.alignment: Qt.AlignTop
                                                    size: 12
                                                    fontWeight: "medium"
                                                }

                                            }

                                        }

                                        Rectangle {
                                            color: "transparent"
                                            width: 260
                                            height: 2

                                            RowLayout {
                                                spacing: 2

                                                Rectangle {
                                                    color: "transparent"
                                                    width: 190
                                                    height: 3

                                                    ColumnLayout {
                                                        spacing: -3

                                                        Rectangle {
                                                            color: Colors.battery_bg
                                                            width: 190
                                                            height: 3
                                                        }

                                                        Rectangle {
                                                            color: Colors.yellow_goldx
                                                            width: 190 * (disk.freeDisk / 100)
                                                            height: 3
                                                        }

                                                    }

                                                }

                                                Text {
                                                    text: disk.freeDisk
                                                    color: Colors.yellow_goldx
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 8
                                                    font.bold: true
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

        }

    }

}
