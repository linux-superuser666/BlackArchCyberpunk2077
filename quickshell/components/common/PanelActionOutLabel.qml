import QtQuick
import QtQuick.Layouts
import qs.styles

RowLayout {
    id: root

    // ===== PUBLIC API =====
    property string keyText: "X"
    property string labelText: "XXXXX"
    property color keyColor: Colors.greyx
    property color labelColor: Colors.redx
    property int keyFontSize: 12
    property int labelFontSize: 14
    property string fontFamily: "Rajdhani"

    spacing: 6

    // ===== KEY BOX =====
    Rectangle {
        width: keyTextItem.implicitWidth
        height: keyTextItem.implicitHeight
        color: "transparent"
        radius: 3
        border.width: 2
        border.color: root.keyColor

        Text {
            id: keyTextItem

            text: root.keyText
            color: root.keyColor
            topPadding: 2
            rightPadding: 5
            bottomPadding: 1
            leftPadding: 5
            font.family: root.fontFamily
            font.pixelSize: root.keyFontSize
            font.weight: Font.Bold
            font.capitalization: Font.AllUppercase
        }

    }

    // ===== LABEL TEXT =====
    Text {
        text: root.labelText
        color: root.labelColor
        font.family: root.fontFamily
        font.pixelSize: root.labelFontSize
        font.weight: Font.Bold
        font.capitalization: Font.AllUppercase
    }

}
