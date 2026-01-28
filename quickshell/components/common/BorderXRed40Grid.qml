import QtQuick
import QtQuick.Shapes
import qs.styles

Item {
    id: root

    property color fillColor: Colors.redx40
    property color borderColor: "transparent"
    property real borderWidth: 0
    readonly property real insetX: 0.005
    readonly property real cutTop: 0.5
    readonly property real cutBottom: 0.35

    width: 217
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
