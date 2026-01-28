import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland

Item {
    id: radioStationWrapper

    property bool active: false
    property int panelWidth: 420
    property int panelHeight: 300
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
