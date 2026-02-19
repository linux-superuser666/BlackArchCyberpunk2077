import QtQuick
import QtQuick.Shapes
import qs.styles as Styles

Shape {
    id: root

    property int boxWidth: 260
    property int boxHeight: 80
    property color bgColor: Styles.Colors.redx80
    property color borderColor: Styles.Colors.yellow_goldx
    property real borderWidth: 1

    width: boxWidth
    height: boxHeight

    ShapePath {
        id: fillPath

        strokeWidth: 0
        fillColor: root.bgColor
        startX: width * 0.03
        startY: height * 0.2

        PathLine {
            x: width * 0.97
            y: height * 0.2
        }

        PathLine {
            x: width
            y: height * 0.2
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.02
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.85
        }

        PathLine {
            x: 1
            y: 1
        }

        PathLine {
            x: width * 0.03
            y: height * 0.2
        }

    }

    ShapePath {
        strokeWidth: root.borderWidth
        strokeColor: root.borderColor
        fillColor: "transparent"
        joinStyle: ShapePath.RoundJoin
        capStyle: ShapePath.RoundCap
        startX: width * 0.03
        startY: height * 0.2

        PathLine {
            x: width * 0.97
            y: height * 0.2
        }

        PathLine {
            x: width
            y: height * 0.2
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.02
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.85
        }

        PathLine {
            x: 1
            y: 1
        }

        PathLine {
            x: width * 0.03
            y: height * 0.2
        }

    }

}
