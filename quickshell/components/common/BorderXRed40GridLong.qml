import QtQuick
import QtQuick.Shapes
import qs.styles

Item {
    id: root

    property color fillColor: Colors.redx40
    property color borderColor: "transparent"
    property real borderWidth: 0
    readonly property real insetX: 0.002
    readonly property real cutTop: 0.48
    readonly property real cutBottom: 0.3
    property int lineWidth: 0

    implicitWidth: lineWidth > 0 ? lineWidth : 440
    height: 6

    Shape {
        anchors.fill: parent
        antialiasing: true

        ShapePath {
            strokeColor: root.borderColor
            strokeWidth: root.borderWidth
            fillColor: root.fillColor
            startX: 0
            startY: 0

            // top edge
            PathLine {
                x: root.width * insetX
                y: 0
            }

            PathLine {
                x: root.width * insetX
                y: root.height * cutTop
            }

            PathLine {
                x: root.width * (1 - insetX)
                y: root.height * cutTop
            }

            PathLine {
                x: root.width * (1 - insetX)
                y: 0
            }

            PathLine {
                x: root.width
                y: 0
            }

            PathLine {
                x: root.width
                y: root.height
            }

            PathLine {
                x: root.width * (1 - insetX)
                y: root.height
            }

            PathLine {
                x: root.width * (1 - insetX)
                y: root.height * cutBottom
            }

            PathLine {
                x: root.width * insetX
                y: root.height * cutBottom
            }

            PathLine {
                x: root.width * insetX
                y: root.height
            }

            PathLine {
                x: 0
                y: root.height
            }

            PathLine {
                x: 0
                y: 0
            }

        }

    }

}
