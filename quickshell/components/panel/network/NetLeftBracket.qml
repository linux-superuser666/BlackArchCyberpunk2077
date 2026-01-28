import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Effects
import QtQuick.Shapes
import qs.styles

Shape {
    id: root

    property int boxWidth: 10
    property int boxHeight: 500
    property color bgColor: Colors.darkbluex
    property color borderColor: Colors.redx
    property real borderWidth: 1
    property real cut: 8

    width: boxWidth
    height: boxHeight
    layer.enabled: true
    layer.smooth: true

    ShapePath {
        strokeWidth: 0
        fillColor: root.bgColor
        startX: cut
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
            x: cut
            y: height
        }

        PathLine {
            x: 0
            y: height - cut
        }

        PathLine {
            x: 0
            y: cut
        }

        PathLine {
            x: cut
            y: 0
        }

    }

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
            x: width * 0.05
            y: height
        }

        PathLine {
            x: 0
            y: height * 0.7
        }

        PathLine {
            x: 0
            y: 0
        }

    }

    layer.effect: DropShadow {
        samples: 17
        source: root
        horizontalOffset: 0
        verticalOffset: 0
        radius: 6
        color: Colors.redx
    }

}
