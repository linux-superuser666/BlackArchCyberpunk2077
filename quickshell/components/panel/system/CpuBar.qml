import QtQuick
import QtQuick.Shapes
import qs.styles as Styles

Shape {
    id: root

    property int boxWidth: 100
    property int boxHeight: 10
    property color fillColor: Styles.Colors.redx

    width: boxWidth
    height: boxHeight

    ShapePath {
        strokeWidth: 0
        fillColor: root.fillColor
        startX: 0
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height * 0.5
        }

        PathLine {
            x: width * 0.97
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

    }

}
