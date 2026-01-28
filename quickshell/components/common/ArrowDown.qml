import QtQuick
import QtQuick.Shapes

Item {
    id: root

    // ===== Public API =====
    property color fillColor: "white"

    width: 40
    height: 60

    Shape {
        anchors.fill: parent
        rotation: 90
        transformOrigin: Item.Center

        ShapePath {
            strokeWidth: 0
            fillColor: root.fillColor
            startX: 0
            startY: height * 0.2

            PathLine {
                x: width * 0.6
                y: height * 0.2
            }

            PathLine {
                x: width * 0.6
                y: 0
            }

            PathLine {
                x: width
                y: height * 0.5
            }

            PathLine {
                x: width * 0.6
                y: height
            }

            PathLine {
                x: width * 0.6
                y: height * 0.8
            }

            PathLine {
                x: 0
                y: height * 0.8
            }

            PathLine {
                x: 0
                y: height * 0.2
            }

        }

    }

}
