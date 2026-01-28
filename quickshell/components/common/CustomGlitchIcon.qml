import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.styles

Rectangle {
    height: 30
    width: 340
    color: "transparent"

    ColumnLayout {
        spacing: 1

        Rectangle {
            width: 100
            height: 6
            color: "transparent"

            Text {
                text: "CUSTOM GLITCHES ON UI MAY APPEAR BASES ON ANALISE"
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
                text: "DOCUMENTATION/JOURNAL/SYNTAX/COMMENT/HACK & CODE"
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
                text: "TYPE: CYBERSPACE"
                font.family: "Rajdhani"
                font.pixelSize: 6
                font.bold: true
                color: Colors.redx
            }

        }

    }

}
