import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    // ===== REUSABLE PROPERTIES =====
    property int boxWidth: 200
    property int boxHeight: 80
    property real borderWidth: 2
    property color borderColor: "#ff0033"
    // gradient
    property color gradStart: "#0a0a12"
    property color gradEnd: "#1a1a2a"

    width: boxWidth
    height: boxHeight

    // ===== FILL (GRADIENT) =====
    ShapePath {
        strokeWidth: 0
        startX: width * 0
        startY: height * 0

        // 100% 0
        PathLine {
            x: width * 1
            y: height * 0
        }

        // 100% 50%
        PathLine {
            x: width * 1
            y: height * 0.5
        }

        // 44% 100%
        PathLine {
            x: width * 0.92
            y: height * 1
        }

        // 0% 100%
        PathLine {
            x: width * 0
            y: height * 1
        }

        // CLOSE
        PathLine {
            x: width * 0
            y: height * 0
        }

        fillGradient: LinearGradient {
            x1: 0
            y1: 0
            x2: width
            y2: height

            GradientStop {
                position: 0
                color: root.gradStart
            }

            GradientStop {
                position: 1
                color: root.gradEnd
            }

        }

    }

    // ===== BORDER =====
    ShapePath {
        strokeWidth: root.borderWidth
        strokeColor: root.borderColor
        fillColor: "transparent"
        joinStyle: ShapePath.MiterJoin
        capStyle: ShapePath.SquareCap
        startX: width * 0
        startY: height * 0

        PathLine {
            x: width * 1
            y: height * 0
        }

        PathLine {
            x: width * 1
            y: height * 0.5
        }

        PathLine {
            x: width * 0.92
            y: height * 1
        }

        PathLine {
            x: width * 0
            y: height * 1
        }

        PathLine {
            x: width * 0
            y: height * 0
        }

    }

}
