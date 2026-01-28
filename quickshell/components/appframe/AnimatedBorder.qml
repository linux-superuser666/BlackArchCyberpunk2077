import QtQuick
import QtQuick
import QtQuick.Layouts

BorderShape {
    id: root

    property real baseWidth: 0
    property real expand: 50
    property int duration: 1000
    property int pauseDuration: 7000
    property bool expandFromLeft: true
    property real animValue: 0
    property real progress: expand > 0 ? animValue / expand : 0

    pathWidth: baseWidth
    Layout.leftMargin: expandFromLeft ? animValue : 0
    Layout.rightMargin: expandFromLeft ? 0 : animValue
    opacity: (1 + Math.cos(3 * Math.PI * progress)) / 3

    SequentialAnimation on animValue {
        id: anim

        loops: Animation.Infinite
        running: true

        NumberAnimation {
            from: 0
            to: expand
            duration: root.duration
            easing.type: Easing.InOutCubic
        }

        NumberAnimation {
            from: expand
            to: 0
            duration: root.duration
            easing.type: Easing.InOutCubic
        }

        PauseAnimation {
            duration: root.pauseDuration
        }

    }

}
