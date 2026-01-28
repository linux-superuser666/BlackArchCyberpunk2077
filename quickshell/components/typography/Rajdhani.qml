import Qt5Compat.GraphicalEffects
import QtQuick
import qs.styles

Item {
    id: root

    property string text: ""
    property color color: Colors.redx
    property int size: 12
    property string fontWeight: "normal"
    property bool uppercase: false
    property int pl: 0
    property int pr: 0
    property int pt: 0
    property int pb: 0

    implicitWidth: textItem.implicitWidth + pl + pr
    implicitHeight: textItem.implicitHeight + pt + pb

    Text {
        id: textItem

        text: root.text
        color: root.color
        topPadding: root.pt
        rightPadding: root.pr
        bottomPadding: root.pb
        leftPadding: root.pl
        font.family: "Rajdhani"
        font.pixelSize: root.size
        font.weight: {
            switch (root.fontWeight) {
            case "bold":
                return Font.Bold;
            case "semibold":
                return Font.DemiBold;
            case "medium":
                return Font.Medium;
            default:
                return Font.Normal;
            }
        }
        font.capitalization: root.uppercase ? Font.AllUppercase : Font.MixedCase
    }

}
