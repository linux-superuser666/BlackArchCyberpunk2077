import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.styles as Styles

Rectangle {
    id: controlIconBox

    property color bgColor: "transparent"
    property color borderColor: Styles.Colors.redx40
    property real borderWidth: 1

    width: 40
    height: 40
    color: "transparent"

    ColumnLayout {
        spacing: 1

        Rectangle {
            width: 23
            radius: 2
            Layout.alignment: Qt.AlignHCenter
            height: 2
            color: Styles.Colors.redx40
        }

        Shape {
            width: 40
            height: 40

            ShapePath {
                strokeWidth: 0
                fillColor: controlIconBox.bgColor
                startX: width * 0
                startY: height * 0

                PathLine {
                    x: width * 0.22
                    y: height * 0
                }

                PathLine {
                    x: width * 0.3
                    y: height * 0.05
                }

                PathLine {
                    x: width * 0.73
                    y: height * 0.05
                }

                PathLine {
                    x: width * 0.81
                    y: height * 0
                }

                PathLine {
                    x: width * 1
                    y: height * 0
                }

                PathLine {
                    x: width * 1
                    y: height * 0.56
                }

                PathLine {
                    x: width * 0.94
                    y: height * 0.65
                }

                PathLine {
                    x: width * 0.94
                    y: height * 0.97
                }

                PathLine {
                    x: width * 0.71
                    y: height * 1
                }

                PathLine {
                    x: width * 0.1
                    y: height * 1
                }

                PathLine {
                    x: width * 0
                    y: height * 0.94
                }

                PathLine {
                    x: width * 0
                    y: height * 0
                }

            }

            // ===== BORDER (IDENTIK, WAJIB) =====
            ShapePath {
                strokeWidth: controlIconBox.borderWidth
                strokeColor: controlIconBox.borderColor
                fillColor: "transparent"
                joinStyle: ShapePath.RoundJoin
                capStyle: ShapePath.RoundCap
                startX: width * 0
                startY: height * 0

                PathLine {
                    x: width * 0.22
                    y: height * 0
                }

                PathLine {
                    x: width * 0.3
                    y: height * 0.05
                }

                PathLine {
                    x: width * 0.73
                    y: height * 0.05
                }

                PathLine {
                    x: width * 0.81
                    y: height * 0
                }

                PathLine {
                    x: width * 1
                    y: height * 0
                }

                PathLine {
                    x: width * 1
                    y: height * 0.56
                }

                PathLine {
                    x: width * 0.94
                    y: height * 0.65
                }

                PathLine {
                    x: width * 0.94
                    y: height * 0.97
                }

                PathLine {
                    x: width * 0.71
                    y: height * 1
                }

                PathLine {
                    x: width * 0.1
                    y: height * 1
                }

                PathLine {
                    x: width * 0
                    y: height * 0.94
                }

                PathLine {
                    x: width * 0
                    y: height * 0
                }

            }

        }

    }

}
