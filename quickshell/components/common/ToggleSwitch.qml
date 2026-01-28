import QtQuick
import qs.components.common
import qs.styles

Item {
    id: root

    // ===== PUBLIC API =====
    property bool checked: false
    property int switchWidth: 75
    property int switchHeight: 22
    property color onColor: Colors.cyanx
    property color offColor: Colors.redx80
    property color borderColor: Colors.redx40

    signal toggled(bool checked)

    width: switchWidth
    height: switchHeight

    // ===== TRACK =====
    Rectangle {
        id: track

        anchors.fill: parent
        color: "transparent"
        implicitWidth: 0
        implicitHeight: 0

        ToggleSwitchFrame {
            boxWidth: 75
            boxHeight: 23
            bgColor: Colors.darkbluex
            borderColor: Colors.redx40
            borderWidth: 1
        }

        Behavior on color {
            ColorAnimation {
                duration: 180
            }

        }

    }

    // ===== KNOB =====
    Rectangle {
        id: knob

        width: 35
        height: 18
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: root.checked ? root.width - width - 3 : 2

        ToggleSwitchKnob {
            anchors.fill: parent
            bgColor: root.checked ? onColor : offColor
            borderWidth: 0
        }

        Behavior on anchors.leftMargin {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }

        }

    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.checked = !root.checked;
            root.toggled(root.checked);
        }
    }

}
