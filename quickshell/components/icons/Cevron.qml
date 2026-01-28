import QtQuick
import QtQuick.Shapes
import qs.styles

Shape {
    // "left"

    id: root

    // ===== REUSABLE PROPERTIES =====
    property int boxWidth: 10
    property int boxHeight: 10
    property color bgColor: Colors.darkbluex
    property color borderColor: Colors.greyx70
    property real borderWidth: 1
    // kiri / kanan
    property string direction: "left"

    width: boxWidth
    height: boxHeight

    // ===== FILL =====
    ShapePath {
        strokeWidth: 0
        fillColor: root.bgColor
        startX: width * 0.52
        startY: 0

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.84
            y: height
        }

        PathLine {
            x: width * 0.74
            y: height * 0.81
        }

        PathLine {
            x: width * 0.24
            y: height * 0.83
        }

        PathLine {
            x: width * 0.14
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: width * 0.52
            y: 0
        }

    }

    // ===== BORDER =====
    ShapePath {
        strokeWidth: root.borderWidth
        strokeColor: root.borderColor
        fillColor: "transparent"
        joinStyle: ShapePath.RoundJoin
        capStyle: ShapePath.RoundCap
        startX: width * 0.52
        startY: 0

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.84
            y: height
        }

        PathLine {
            x: width * 0.74
            y: height * 0.81
        }

        PathLine {
            x: width * 0.24
            y: height * 0.83
        }

        PathLine {
            x: width * 0.14
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: width * 0.52
            y: 0
        }

    }

    transform: Rotation {
        origin.x: root.width / 2
        origin.y: root.height / 2
        angle: direction === "left" ? -90 : 90
    }

}
