import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    // ===== REUSABLE SIZE =====
    property int boxWidth: 260
    property int boxHeight: 80
    // ===== STYLE =====
    property real borderWidth: 2
    property color borderColor: "#ff0033"
    property color gradStart: "#05050a"
    property color gradEnd: "#1a1a2a"

    width: boxWidth
    height: boxHeight

    // ===== FILL =====
    ShapePath {
        strokeWidth: 0
        startX: width * 0.18
        startY: height * 0.012

        PathLine {
            x: width * 0.5
            y: height * 0.012
        }

        PathLine {
            x: width * 0.65
            y: height * 0
        }

        PathLine {
            x: width * 1
            y: height * 0
        }

        PathLine {
            x: width * 1
            y: height * 0.3
        }

        PathLine {
            x: width * 0.9
            y: height * 0.32
        }

        PathLine {
            x: width * 0.9
            y: height * 0.7
        }

        PathLine {
            x: width * 1
            y: height * 0.72
        }

        PathLine {
            x: width * 1
            y: height * 1
        }

        PathLine {
            x: width * 0.15
            y: height * 1
        }

        PathLine {
            x: width * 0
            y: height * 0.98
        }

        PathLine {
            x: width * 0
            y: height * 0.02
        }

        // 🔒 CLOSE PATH
        PathLine {
            x: width * 0.12
            y: height * 0.012
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

    // ===== BORDER (IDENTIK) =====
    ShapePath {
        strokeWidth: root.borderWidth
        strokeColor: root.borderColor
        fillColor: "transparent"
        joinStyle: ShapePath.MiterJoin
        capStyle: ShapePath.SquareCap
        startX: width * 0.18
        startY: height * 0.012

        PathLine {
            x: width * 0.5
            y: height * 0.012
        }

        PathLine {
            x: width * 0.65
            y: height * 0
        }

        PathLine {
            x: width * 1
            y: height * 0
        }

        PathLine {
            x: width * 1
            y: height * 0.3
        }

        PathLine {
            x: width * 0.9
            y: height * 0.32
        }

        PathLine {
            x: width * 0.9
            y: height * 0.7
        }

        PathLine {
            x: width * 1
            y: height * 0.72
        }

        PathLine {
            x: width * 1
            y: height * 1
        }

        PathLine {
            x: width * 0.15
            y: height * 1
        }

        PathLine {
            x: width * 0
            y: height * 0.98
        }

        PathLine {
            x: width * 0
            y: height * 0.02
        }

        PathLine {
            x: width * 0.12
            y: height * 0.012
        }

    }

}
