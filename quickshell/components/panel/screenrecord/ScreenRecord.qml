import QtMultimedia
import QtQuick
import QtQuick.Layouts
import qs.components.panel.wlogout
import qs.state
import qs.styles

Rectangle {
    id: root

    property int currentIndex: 0
    property bool keyboardMode: true
    default property list<ScreenRecordButton> buttons

    width: 300
    height: 160
    color: "transparent"
    focus: true
    activeFocusOnTab: true
    Component.onCompleted: forceActiveFocus()
    Keys.onPressed: (event) => {
        if (!GlobalState.screenRecordActive)
            return ;

        keyboardMode = true;
        let total = buttons.length;
        let cols = 3;
        let rows = Math.ceil(total / cols);
        let row = Math.floor(currentIndex / cols);
        let col = currentIndex % cols;
        switch (event.key) {
        case Qt.Key_Escape:
            GlobalState.closeScreenRecord();
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

    SoundEffect {
        id: hoverSound

        source: "../../../assets/fx/hover.wav"
    }

    RowLayout {
        spacing: 2
        anchors.centerIn: parent

        // LEFT BIG BRACKET
        Rectangle {
            width: 24
            height: 150
            color: "transparent"

            WlogoutBracket {
                boxHeight: parent.height
                boxWidth: parent.width
                borderWidth: 1
                borderColor: Colors.redx80
                gradStart: Colors.redx40
                gradEnd: Colors.redx70
            }

        }

        // GRID AREA
        Rectangle {
            width: 240
            height: 150
            color: "transparent"

            GridLayout {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                columns: 3
                columnSpacing: 1
                rowSpacing: 4

                Repeater {
                    model: root.buttons

                    delegate: Rectangle {
                        id: shotButton

                        required property ScreenRecordButton modelData
                        required property int index

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"

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

                        RowLayout {
                            anchors.centerIn: parent
                            spacing: 2

                            Rectangle {
                                width: 12
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
                                width: 63
                                height: 70
                                color: "transparent"

                                WlogoutButtons {
                                    boxWidth: parent.width
                                    boxHeight: parent.height
                                    bgColor: root.keyboardMode ? (root.currentIndex === index ? Colors.redx70 : Colors.darkbluex) : (ma.containsMouse ? Colors.redx70 : Colors.darkbluex80)
                                    borderColor: Colors.redx80
                                    borderWidth: 1
                                }

                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: -5

                                    Text {
                                        text: "󰑋"
                                        font.pointSize: Texts.xxxl
                                        font.family: "mono"
                                        font.weight: Font.Medium
                                        color: Colors.greyx
                                        horizontalAlignment: Text.AlignHCenter
                                    }

                                    Text {
                                        text: modelData.text
                                        font.pointSize: Texts.xs
                                        font.family: "Rajdhani"
                                        font.weight: Font.Medium
                                        color: "white"
                                        horizontalAlignment: Text.AlignHCenter
                                    }

                                }

                            }

                        }

                        Behavior on color {
                            ColorAnimation {
                                duration: 120
                            }

                        }

                    }

                }

            }

        }

    }

}
