import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Shape {
    id: root

    property color fillColor: "transparent"
    property color strokeColor: "red"
    property real strokeWidth: 1
    property int boxWidth: 8
    property int boxHeight: 40

    width: root.boxWidth
    height: root.boxHeight

    ShapePath {
        strokeWidth: root.strokeWidth
        strokeColor: root.strokeColor
        fillColor: root.fillColor
        startX: width * 0.2
        startY: height * 0.5

        PathLine {
            x: 0
            y: height * 0.47
        }

        PathLine {
            x: 0
            y: 0
        }

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.8
        }

        PathLine {
            x: width * 0.15
            y: height * 0.78
        }

        PathLine {
            x: width * 0.15
            y: height * 0.51
        }

    }

}
