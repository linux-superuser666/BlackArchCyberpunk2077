import QtQuick
import QtQuick.Shapes
import qs.styles

Shape {
    id: root

    // === Reusable API ===
    property color fillColor: Colors.whitex
    property color strokeColor: "transparent"
    property real strokeWidth: 1

    width: 14
    height: 14

    ShapePath {
        strokeWidth: root.strokeWidth
        strokeColor: root.strokeColor
        fillColor: root.fillColor
        startX: width
        startY: 0

        PathLine {
            x: width
            y: height * 0.01
        }

        PathLine {
            x: width * 0.05
            y: height * 0.05
        }

        PathLine {
            x: width * 0.01
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: 0
            y: 0
        }

        PathLine {
            x: width
            y: 0
        }

    }

}
