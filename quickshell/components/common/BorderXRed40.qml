import QtQuick
import QtQuick.Layouts
import qs.styles

Rectangle {
    id: root

    property int thickness: 1
    property int lineWidth: 0
    property color lineColor: Colors.redx40

    height: thickness
    color: lineColor
    implicitWidth: lineWidth > 0 ? lineWidth : 100
    Layout.fillWidth: lineWidth === 0
    Layout.preferredWidth: lineWidth > 0 ? lineWidth : implicitWidth
}
