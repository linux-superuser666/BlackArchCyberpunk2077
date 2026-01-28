import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.components.appframe
import qs.styles

PanelWindow {
    id: floatingBg

    required property var screen

    screen: screen
    visible: true
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Bottom

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Rectangle {
        id: frame

        anchors.centerIn: parent
        width: 1275
        height: 650
        color: "transparent"
        border.width: 1
        border.color: Colors.redx40

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Item {
                width: 300
                height: parent.height

                RowLayout {
                    anchors.left: parent.left
                    spacing: 0

                    Rectangle {
                        width: 8
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 30
                        expandFromLeft: true
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 25
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 40
                        expandFromLeft: true
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 35
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 50
                        expandFromLeft: true
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 55
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 60
                        expandFromLeft: true
                        pathHeight: frame.height
                    }

                }

            }

            Item {
                Layout.fillWidth: true
            }

            Item {
                width: 300
                height: parent.height

                RowLayout {
                    anchors.right: parent.right
                    spacing: 0

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 60
                        expandFromLeft: false
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 55
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 50
                        expandFromLeft: false
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 35
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 40
                        expandFromLeft: false
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 20
                        height: parent.height
                        color: "transparent"
                    }

                    AnimatedBorder {
                        baseWidth: 0
                        expand: 30
                        expandFromLeft: false
                        pathHeight: frame.height
                    }

                    Rectangle {
                        width: 6
                        height: parent.height
                        color: "transparent"
                    }

                }

            }

        }

    }

}
