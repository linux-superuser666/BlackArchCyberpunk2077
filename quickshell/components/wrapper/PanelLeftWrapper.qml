import QtQuick
import QtQuick.Layouts

Item {
    id: panelLeftWrapper

    property bool active: false
    property int panelWidth: 320
    property int panelHeight: 280
    default property alias content: contentRoot.children

    implicitWidth: active ? panelWidth : 0
    implicitHeight: panelHeight
    opacity: active ? 1 : 0
    clip: true

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Item {
            id: contentRoot

            anchors.fill: parent
        }

    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 280
            easing.type: Easing.OutCubic
        }

    }

    Behavior on opacity {
        NumberAnimation {
            duration: 160
        }

    }

}
