import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    // ===== SIZE (REUSABLE) =====
    property int boxWidth: 240
    property int boxHeight: 120
    property bool followParent: false
    // ===== STYLE =====
    property color bgColor: "#1e1e2e"
    property color borderColor: "#ff5555"
    property real borderWidth: 1

    width: followParent && parent ? parent.width : boxWidth
    height: followParent && parent ? parent.height : boxHeight

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
            x: width * 0.25
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.74
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
        joinStyle: ShapePath.MiterJoin
        capStyle: ShapePath.SquareCap
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
            x: width * 0.25
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.74
        }

        PathLine {
            x: 0
            y: 0
        }

    }

}
