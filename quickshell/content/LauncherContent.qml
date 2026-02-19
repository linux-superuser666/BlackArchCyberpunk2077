import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import QtMultimedia
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.launcher
import qs.components.typography
import qs.content
import qs.scripts
import qs.state
import qs.styles


Rectangle {
    id: root

    property string query: ""
    property bool keyboardPressed: false
    property bool mousePressed: false

    signal requestClose()

    function launchSelected() {
        if (list.currentItem && list.currentItem.modelData) {
            keyboardPressed = true;
            list.currentItem.modelData.execute();
            Qt.callLater(() => {
                return keyboardPressed = false;
            });
            requestClose();
        }
    }

    function resetSearch() {
        input.text = "";
        query = "";
        list.currentIndex = -1;
    }

    SoundEffect {
        id: hoverSound

        source: "../assets/fx/hover.wav"
    }

    width: 400
    height: 500
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        spacing: 8

        ColumnLayout {
            Layout.preferredWidth: 30
            spacing: 10
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            BinLinesState {
                 animate: GlobalState.launcherActive
            }

            Image {
                source: "../assets/icons/panel/hardware-icon.png"
                width: 22
                height: 20
                fillMode: Image.PreserveAspectFit

                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    running: GlobalState.launcherActive && root.visible

                    NumberAnimation {
                        from: 1
                        to: 0
                        duration: 1000
                    }

                    NumberAnimation {
                        from: 0
                        to: 1
                        duration: 1000
                    }

                }

            }

        }

        Rectangle {
            width: 400
            height: 500
            color: "transparent"

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 3

                Orbitron {
                    text: "CONNECTION_D-BUS 1.001.1"
                    size: 8
                    color: Colors.redx70
                }

                Rectangle {
                    height: 33
                    width: 300
                    color: "black"
                    border.width: 1
                    border.color: Colors.redx40

                    RowLayout {
                        Layout.fillWidth: true

                        Rajdhani {
                            text: "  SEQUENCE:"
                            size: 14
                            pt: 5
                            uppercase: true
                            fontWeight: "semibold"
                        }

                        TextField {
                            id: input

                            Layout.fillWidth: true
                            focus: true
                            placeholderText: "........."
                            font.family: "Rajdhani"
                            font.pixelSize: 16
                            font.weight: Font.DemiBold
                            color: "white"
                            onTextChanged: {
                                const upper = text.toUpperCase();
                                if (text !== upper)
                                    text = upper;

                                root.query = text;
                                list.currentIndex = filtered.values.length > 0 ? 0 : -1;
                            }
                            Keys.onEscapePressed: {
                                resetSearch();
                                requestClose();
                            }
                            Keys.onPressed: (event) => {
                                if (event.key === Qt.Key_Up) {
                                    hoverSound.play();
                                    event.accepted = true;
                                    list.currentIndex = Math.max(0, list.currentIndex - 1);
                                } else if (event.key === Qt.Key_Down) {
                                    hoverSound.play();
                                    event.accepted = true;
                                    list.currentIndex = Math.min(list.count - 1, list.currentIndex + 1);
                                } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                    event.accepted = true;
                                    launchSelected();
                                    resetSearch();
                                }
                            }

                            background: Rectangle {
                                color: "black"
                            }

                        }

                    }

                }

                LauncherFilter {
                    id: filtered

                    query: root.query
                }

                ListView {
                    id: list

                    width: 300
                    height: 340
                    model: filtered.values
                    clip: true
                    focus: true
                    keyNavigationWraps: true
                    currentIndex: filtered.values.length > 0 ? 0 : -1
                    highlightFollowsCurrentItem: true
                    highlightMoveDuration: 0

                    highlight: Item {
                        width: list.width
                        height: 47
                        z: 10
                        visible: list.currentItem !== null

                        AppButton {
                            appName: list.currentItem?.modelData?.name?.toUpperCase() ?? ""
                            appNameColor: Colors.greyx
                            appNameWeight: "bold"
                            appType: list.currentItem?.modelData?.categories?.[0] ?? ""
                            appCategory:  list.currentItem?.modelData?.comment?.[0] ?? ""
                            appStatus: "SELECT"
                            appDetailFillColor: Colors.redx40
                            appDetailStrokeColor: Colors.redx40
                            appDetailBracketFillColor: Colors.redx40
                            appDetailBracketStrokeColor: Colors.redx40
                            appIndicatorStatus: "!"
                            appIndicatorBgColor: Colors.yellow_goldx
                            appIndicatorBorderColor: Colors.orangex
                            buttonWidth: 298
                            buttonHeight: 47

                        }

                    }

                    delegate: Item {
                        required property var modelData
                        required property int index

                        width: list.width
                        height: 47

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                hoverSound.play();
                                list.currentIndex = index
                            }
                            onPressed: root.mousePressed = true
                            onReleased: root.mousePressed = false
                            onClicked: list.currentIndex = index
                            onDoubleClicked: root.launchSelected()
                        }

                        AppButton {
                            visible: !ListView.isCurrentItem
                            appName: modelData.name.toUpperCase()
                            appNameColor: Colors.greyx
                            appNameWeight: "medium"
                            appType: modelData.categories?.length > 0 ?  modelData.categories[0] : ""
                            appCategory: modelData.comment && modelData.comment.length > 0
                                        ? modelData.comment
                                        : ""
                            appStatus: "IDLE"
                            appDetailFillColor: Colors.darkbluex80
                            appDetailStrokeColor: Colors.redx40
                            appDetailBracketFillColor: Colors.darkbluex80
                            appDetailBracketStrokeColor: Colors.redx40
                            appIndicatorStatus: "!"
                            appIndicatorStatusColor: "transparent"
                            appIndicatorBgColor: Colors.darkbluex80
                            appIndicatorBorderColor: Colors.redx40
                            buttonWidth: 298
                            buttonHeight: 47
                        }

                    }

                }

                BorderXRed40 {
                    lineWidth: 298
                }

                RowLayout {
                    spacing: 10

                    SysImgText {
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        width: radioStop.implicitWidth
                        height: radioStop.implicitHeight
                        color: "transparent"

                        PanelActionOutLabel {
                            id: radioStop

                            keyText: "󰌑"
                            labelText: "LAUNCH"
                        }

                    }

                    Rectangle {
                        width: radioExit.implicitWidth
                        height: radioExit.implicitHeight
                        color: "transparent"

                        PanelActionOutLabel {
                            id: radioExit

                            keyText: "esc"
                            labelText: "CLose"
                        }


                    }

                }

            }

        }

    }

}
