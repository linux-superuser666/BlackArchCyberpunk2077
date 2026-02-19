import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.components.panel.wlogout
import qs.state
import qs.styles

Rectangle {
    id: root

    property int currentIndex: 0
    default property list<LogoutButton> buttons
    property bool keyboardMode: true

    Keys.onPressed: (event) => {
        keyboardMode = true;
        let total = buttons.length;
        let cols = 3;
        let rows = Math.ceil(total / cols);
        let row = Math.floor(currentIndex / cols);
        let col = currentIndex % cols;
        switch (event.key) {
        case Qt.Key_Escape:
            GlobalState.closeWLogOut();
            event.accepted = true;
            return ;
        case Qt.Key_Return:
        case Qt.Key_Enter:
            buttons[currentIndex].exec();
            event.accepted = true;
            return ;
        case Qt.Key_Right:
            col = (col + 1) % cols;
            break;
        case Qt.Key_Left:
            col = (col - 1 + cols) % cols;
            break;
        case Qt.Key_Down:
            row = (row + 1) % rows;
            break;
        case Qt.Key_Up:
            row = (row - 1 + rows) % rows;
            break;
        default:
            return ;
        }
        let newIndex = row * cols + col;
        if (newIndex < total)
            currentIndex = newIndex;

        event.accepted = true;
    }
    onVisibleChanged: {
        if (visible)
            currentIndex = 0;

    }
    width: 270
    height: 142
    color: "transparent"
    focus: true
    activeFocusOnTab: true
    Component.onCompleted: {
        Qt.callLater(() => {
            return forceActiveFocus();
        });
    }

    SoundEffect {
        id: hoverSound

        source: "../../../assets/fx/hover.wav"
    }

    RowLayout {
        spacing: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            width: 24
            color: "transparent"
            height: 144

            WlogoutBracket {
                boxHeight: parent.height
                boxWidth: parent.width
                borderWidth: 1
                borderColor: Colors.redx80
                gradStart: Colors.redx40
                gradEnd: Colors.redx70
            }

        }

        Rectangle {
            color: "transparent"
            width: 246
            height: 142

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()

                GridLayout {
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    columns: 3
                    columnSpacing: 0
                    rowSpacing: 5

                    Repeater {
                        id: gridRepeater

                        model: buttons

                        delegate: Rectangle {
                            required property LogoutButton modelData
                            required property int index

                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "transparent"
                            border.color: "transparent"
                            border.width: ma.containsMouse ? 0 : 0

                            RowLayout {
                                spacing: 2

                                Rectangle {
                                    width: 10
                                    height: 70
                                    color: "transparent"

                                    WlogoutButtonBracket {
                                        gradStart: Colors.redx40
                                        gradEnd: Colors.redx80
                                        strokeColor: Colors.redx80
                                        strokeWidth: 1
                                        boxWidth: parent.width
                                        boxHeight: parent.height
                                    }

                                }

                                Rectangle {
                                    width: 67
                                    height: 70
                                    color: "transparent"

                                    WlogoutButtons {
                                        boxWidth: parent.width
                                        boxHeight: parent.height
                                        bgColor: root.keyboardMode ? (root.currentIndex === index ? Colors.redx70 : Colors.darkbluex80) : (ma.containsMouse ? Colors.redx70 : Colors.darkbluex80)
                                        borderColor: Colors.redx80
                                        borderWidth: 1
                                    }

                                }

                            }

                            MouseArea {
                                id: ma

                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    root.keyboardMode = false;
                                    hoverSound.play();
                                }
                                onClicked: modelData.exec()
                            }

                            Image {
                                id: icon

                                anchors.centerIn: parent
                                source: `../../../assets/icons/power/${modelData.icon}.png`
                                width: parent.width * 0.3
                                height: parent.width * 0.3
                            }

                            Text {
                                text: modelData.text
                                font.pointSize: Texts.xxs
                                font.weight: Font.Medium
                                font.family: "Rajdhani"
                                color: "white"

                                anchors {
                                    top: icon.bottom
                                    topMargin: 1
                                    horizontalCenter: parent.horizontalCenter
                                }

                            }

                        }

                    }

                }

            }

        }

    }

}
