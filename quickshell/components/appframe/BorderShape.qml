import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    property int pathWidth: 0
    property int pathHeight: 678
    property color strokeCol: Qt.rgba(25 / 255, 1, 0, 0.2)

    width: pathWidth
    height: pathHeight

    ShapePath {
        strokeWidth: 1
        strokeColor: root.strokeCol
        fillColor: "transparent"
        startX: 0
        startY: 0

        // TOP
        PathLine {
            x: root.pathWidth
            y: 0
        }

        // RIGHT
        PathLine {
            x: root.pathWidth
            y: root.pathHeight
        }

        // BOTTOM
        PathLine {
            x: 0
            y: root.pathHeight
        }

        // LEFT
        PathLine {
            x: 0
            y: 0
        }

    }

}
