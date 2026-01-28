import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Shape {
    id: root

    // ===== Public API =====
    property color strokeColor: "transparent"
    property color fillColor: "transparent"
    property real strokeWidth: 1

    width: 235
    height: 47

    ShapePath {
        strokeWidth: root.strokeWidth
        strokeColor: root.strokeColor
        fillColor: root.fillColor
        startX: width * 0.18
        startY: 0

        PathLine {
            x: width * 0.2
            y: height * 0.08
        }

        PathLine {
            x: width
            y: height * 0.08
        }

        PathLine {
            x: width
            y: height * 0.8
        }

        PathLine {
            x: width * 0.95
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
            x: width * 0.18
            y: 0
        }

    }

}
