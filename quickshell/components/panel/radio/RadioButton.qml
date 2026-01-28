import QtQuick
import QtQuick.Shapes
import qs.styles

Shape {
    id: root

    property int btnWidth: 100
    property int btnHeight: 50
    property color btnBg: "black"
    property color btnBorderColor: "red"
    property real btnBorderWidth: 1

    width: btnWidth
    height: btnHeight

    ShapePath {
        strokeWidth: 0
        fillColor: root.btnBg
        startX: 0
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height * 0.6
        }

        PathLine {
            x: width * 0.96
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

    ShapePath {
        strokeWidth: root.btnBorderWidth
        strokeColor: root.btnBorderColor
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
            y: height * 0.6
        }

        PathLine {
            x: width * 0.96
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
