import QtQuick

Rectangle {
    width: 80
    height: 3
    color: "transparent"

    Text {
        text: ""
        color: "yellow"
        font.pixelSize: 2
        font.family: "Rajdhani"
    }

    Rectangle {
        width: parent.width * volLevel / 100
        height: parent.height
        color: Qt.rgba(255, 255, 255, 0.4)
    }

}
