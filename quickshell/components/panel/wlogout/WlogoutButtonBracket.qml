import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    property color fillColor: "transparent"
    property color strokeColor: "white"
    property real strokeWidth: 1
    property real boxWidth: width
    property real boxHeight: height
    property color gradStart: "#05050a"
    property color gradEnd: "#1a1a2a"

    width: 200
    height: 60

    ShapePath {
        strokeWidth: root.strokeWidth
        strokeColor: root.strokeColor
        //   fillColor: root.fillColor
        joinStyle: ShapePath.MiterJoin
        startX: boxWidth * 0.1
        startY: boxHeight * 0.55

        PathLine {
            x: boxWidth * 0
            y: boxHeight * 0.55
        }

        PathLine {
            x: boxWidth * 0
            y: boxHeight * 0.01
        }

        PathLine {
            x: boxWidth * 1
            y: boxHeight * 0.01
        }

        PathLine {
            x: boxWidth * 1
            y: boxHeight * 0.6
        }

        PathLine {
            x: boxWidth * 0.4
            y: boxHeight * 0.6
        }

        PathLine {
            x: boxWidth * 0.4
            y: boxHeight * 0.62
        }

        PathLine {
            x: boxWidth * 1
            y: boxHeight * 0.62
        }

        PathLine {
            x: boxWidth * 1
            y: boxHeight * 1
        }

        PathLine {
            x: boxWidth * 0
            y: boxHeight * 1
        }

        PathLine {
            x: boxWidth * 0
            y: boxHeight * 0.8
        }

        PathLine {
            x: boxWidth * 0.08
            y: boxHeight * 0.8
        }

        PathLine {
            x: boxWidth * 0
            y: boxHeight * 0.56
        }

        fillGradient: LinearGradient {
            x1: 0
            y1: 0
            x2: width
            y2: height

            GradientStop {
                position: 0
                color: root.gradStart
            }

            GradientStop {
                position: 1
                color: root.gradEnd
            }

        }

    }

}
