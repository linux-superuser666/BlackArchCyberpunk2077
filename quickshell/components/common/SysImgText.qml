import QtQuick
import QtQuick.Layouts
import qs.styles

ColumnLayout {
    id: root

    // ===== REUSABLE PROPERTIES =====
    property color textColor: Colors.redx40
    property int size: 8
    property int pl: 0
    property int pr: 0
    property int pt: 0
    property int pb: 0

    spacing: -3

    // ===== ITEM 1 =====
    Text {
        text: "IMAGE_NAME=BLACKARCH-LINUX"
        color: root.textColor
        font.pixelSize: root.size
        font.family: "Rajdhani"
        font.bold: true
        Layout.leftMargin: root.pl
        Layout.rightMargin: root.pr
        Layout.topMargin: root.pt
    }

    // ===== ITEM 2 =====
    Text {
        text: "IMAGE_TYPE=BLACKARCH-LINUX-SLIM"
        color: root.textColor
        font.pixelSize: root.size
        font.family: "Rajdhani"
        font.bold: true
        Layout.leftMargin: root.pl
        Layout.rightMargin: root.pr
    }

    // ===== ITEM 3 =====
    Text {
        text: "HOME_URL=https://www.blackarch.org/"
        color: root.textColor
        font.pixelSize: root.size
        font.family: "Rajdhani"
        font.bold: true
        Layout.leftMargin: root.pl
        Layout.rightMargin: root.pr
    }

    // ===== ITEM 4 =====
    Text {
        text: "IMAGE_VERSION=2023.05.01"
        color: root.textColor
        font.pixelSize: root.size
        font.family: "Rajdhani"
        font.bold: true
        Layout.leftMargin: root.pl
        Layout.rightMargin: root.pr
        Layout.bottomMargin: root.pb
    }

}
