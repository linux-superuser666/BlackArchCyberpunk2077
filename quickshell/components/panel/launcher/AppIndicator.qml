import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    // ===== REUSABLE PROPERTIES =====
    property int boxWidth: 100
    property int boxHeight: 50
    property color bgColor: "transparent"
    property color borderColor: "#ff5555"
    property real borderWidth: 0

    width: boxWidth
    height: boxHeight

    // ===== FILL =====
    ShapePath {
        strokeWidth: 0
        fillColor: root.bgColor
        startX: 0
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.5
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.5
        }

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

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.5
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.5
        }

        PathLine {
            x: 0
            y: 0
        }

    }

}
