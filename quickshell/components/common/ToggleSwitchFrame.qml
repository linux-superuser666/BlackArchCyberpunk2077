import QtQuick
import QtQuick.Shapes
import qs.styles

Shape {
    id: root

    // ===== REUSABLE PROPERTIES =====
    property int boxWidth: 100
    property int boxHeight: 50
    property color bgColor: Colors.darkbluex
    property color borderColor: Colors.redx40
    property real borderWidth: 1

    width: boxWidth
    height: boxHeight

    // ===== FILL =====
    ShapePath {
        strokeWidth: 0
        fillColor: root.bgColor
        startX: 0
        startY: 0

        // 100% 0
        PathLine {
            x: width
            y: 0
        }

        // 100% 81%
        PathLine {
            x: width
            y: height * 0.7
        }

        // 84% 100%
        PathLine {
            x: width * 0.92
            y: height
        }

        // 0 100%
        PathLine {
            x: 0
            y: height
        }

        // close
        PathLine {
            x: 0
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
        startX: 0
        startY: 0

        // 100% 0
        PathLine {
            x: width
            y: 0
        }

        // 100% 81%
        PathLine {
            x: width
            y: height * 0.7
        }

        // 84% 100%
        PathLine {
            x: width * 0.92
            y: height
        }

        // 0 100%
        PathLine {
            x: 0
            y: height
        }

        // close
        PathLine {
            x: 0
            y: 0
        }

    }

}
