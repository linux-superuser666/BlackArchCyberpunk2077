import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.styles

Rectangle {
    width: parent.width
    height: parent.height
    color: "transparent"

    ColumnLayout {
        spacing: 1
        anchors.bottom: parent.bottom

        Rectangle {
            width: 300
            height: 6
            color: "transparent"

            Text {
                text: "IMAGE_NAME:BlackArch_Linux"
                font.family: "Rajdhani"
                font.pixelSize: 6
                font.bold: true
                color: Colors.redx
            }

        }

        Rectangle {
            width: parent.width
            height: 6
            color: "transparent"

            Text {
                text: "IMAGE_ID:blackarch-linux-slim"
                font.family: "Rajdhani"
                font.pixelSize: 6
                font.bold: true
                color: Colors.redx
            }

        }

        Rectangle {
            width: parent.width
            height: 6
            color: "transparent"

            Text {
                text: "IMAGE_VERSION:2023.05.01"
                font.family: "Rajdhani"
                font.pixelSize: 6
                font.bold: true
                color: Colors.redx
            }

        }

        Rectangle {
            width: parent.width
            height: 6
            color: "transparent"

            Text {
                text: "ANSI_COLOR:0;34"
                font.family: "Rajdhani"
                font.pixelSize: 6
                font.bold: true
                color: Colors.redx
            }

        }

    }

}
