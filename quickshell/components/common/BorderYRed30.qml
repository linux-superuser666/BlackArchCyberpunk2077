import QtQuick
import QtQuick.Layouts
import qs.styles

Rectangle {
    id: root

    property int thickness: 1
    property int lineHeight: 0
    property color lineColor: Colors.redx30

    width: thickness
    color: lineColor
    implicitHeight: lineHeight > 0 ? lineHeight : 100
    Layout.fillHeight: lineHeight === 0
    Layout.preferredHeight: lineHeight > 0 ? lineHeight : implicitHeight
}
