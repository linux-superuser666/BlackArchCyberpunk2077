import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.styles

Rectangle {
    id: binLines

    width: 30
    height: 40
    color: "transparent"

    ColumnLayout {
        spacing: 4

        Rectangle {
            width: binFourLines.implicitWidth
            height: binFourLines.implicitHeight
            color: "transparent"

            ColumnLayout {
                id: binFourLines

                spacing: -2

                Rectangle {
                    width: binLines1.implicitWidth
                    height: binLines1.implicitHeight
                    color: "transparent"

                    Text {
                        id: binLines1

                        text: "10101"
                        color: Colors.redx70
                        font.pixelSize: Texts.xxxs
                        font.weight: Texts.semibold
                        font.family: "Rajdhani"
                        font.letterSpacing: 1
                    }

                }

                Rectangle {
                    width: binLines2.implicitWidth
                    height: binLines2.implicitHeight
                    color: "transparent"

                    Text {
                        id: binLines2

                        text: "10110"
                        color: Colors.redx70
                        font.pixelSize: Texts.xxxs
                        font.weight: Texts.semibold
                        font.family: "Rajdhani"
                        font.letterSpacing: 1
                    }

                }

                Rectangle {
                    width: binLines3.implicitWidth
                    height: binLines3.implicitHeight
                    color: "transparent"

                    Text {
                        id: binLines3

                        text: "11100"
                        color: Colors.redx70
                        font.pixelSize: Texts.xxxs
                        font.weight: Texts.semibold
                        font.family: "Rajdhani"
                        font.letterSpacing: 1
                    }

                }

                Rectangle {
                    width: binLines4.implicitWidth
                    height: binLines4.implicitHeight
                    color: "transparent"

                    Text {
                        id: binLines4

                        text: "10110"
                        color: Colors.redx70
                        font.pixelSize: Texts.xxxs
                        font.weight: Texts.semibold
                        font.family: "Rajdhani"
                        font.letterSpacing: 1
                    }

                }

            }

        }

    }

}
