import QtQuick 2.15
import QtQuick.Shapes 1.15

Shape {
    id: root

    // ===== SIZE =====
    property int boxWidth: 60
    property int boxHeight: 30
    // ===== BORDER =====
    property real borderWidth: 0
    property color borderColor: "transparent"
    // ===== GRADIENT =====
    property real gradAngle: 0
    // 0 = kiri → kanan
    property color color1: "black"
    property color color2: "white"
    property color color3: "grey"
    property color color4: "white"
    property color color5: "black"

    width: boxWidth
    height: boxHeight

    // ===== FILL SHAPE =====
    ShapePath {
        strokeWidth: 0
        startX: width * 0.25
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width * 0.75
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: width * 0.25
            y: 0
        }

        fillGradient: LinearGradient {
            property real rad: Math.PI * root.gradAngle / 180

            x1: 0
            y1: 0
            x2: width * Math.cos(rad)
            y2: height * Math.sin(rad)

            GradientStop {
                position: 0
                color: root.color1
            }

            GradientStop {
                position: 0.25
                color: root.color2
            }

            GradientStop {
                position: 0.5
                color: root.color3
            }

            GradientStop {
                position: 0.75
                color: root.color4
            }

            GradientStop {
                position: 1
                color: root.color5
            }

        }

    }

    // ===== BORDER =====
    ShapePath {
        strokeWidth: root.borderWidth
        strokeColor: root.borderColor
        fillColor: "transparent"
        joinStyle: ShapePath.MiterJoin
        capStyle: ShapePath.SquareCap
        startX: width * 0.25
        startY: 0

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width * 0.75
            y: height
        }

        PathLine {
            x: 0
            y: height
        }

        PathLine {
            x: width * 0.25
            y: 0
        }

    }

}
