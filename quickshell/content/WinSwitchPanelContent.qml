import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.winswitch
import qs.components.typography
import qs.content
import qs.scripts
import qs.state
import qs.styles

Rectangle {
    id: winSwitchPanelContent

    property string activeAddress: ""
    property bool keyboardActive: false

    visible: true
    color: "transparent"
    implicitWidth: contentColumn.implicitWidth
    implicitHeight: contentColumn.implicitHeight
    focus: true
    Keys.onPressed: (event) => {
        if (!GlobalState.winSwitchActive)
            return ;

        keyboardActive = true;
        switch (event.key) {
        case Qt.Key_Up:
            listView.currentIndex = Math.max(0, listView.currentIndex - 1);
            event.accepted = true;
            break;
        case Qt.Key_Down:
            listView.currentIndex = Math.min(listView.count - 1, listView.currentIndex + 1);
            event.accepted = true;
            break;
        case Qt.Key_Return:
        case Qt.Key_Enter:
            const win = listView.model[listView.currentIndex];
            if (win) {
                focusHelper.focusWindow(win);
                GlobalState.closeWinSwitch();
            }
            event.accepted = true;
            break;
        }
    }

    WinSwitchFocus {
        id: focusHelper
    }

    WinSwitchActiveWatch {
        id: activeWin
    }

    WinSwitchList {
        id: winSwitchList
    }

    Timer {
        id: focusTimer

        property string targetAddress: ""

        interval: 40
        repeat: false
        onTriggered: {
            if (targetAddress !== "") {
                Hyprland.dispatch("focuswindow address:" + targetAddress);
                GlobalState.closeWinSwitch();
                targetAddress = "";
            }
        }
    }

    ColumnLayout {
        id: contentColumn

        anchors.fill: parent
        spacing: 1

        RowLayout {
            spacing: 0

            Item {
                width: 30
            }

            Rajdhani {
                size: 8
                text: "TRN_TCLAS_800095"
            }

            FillX {
            }

            Rajdhani {
                size: 8
                uppercase: true
                text: "hyprctl clients"
            }

        }

        RowLayout {
            spacing: 0
            Layout.alignment: Qt.AlignLeft

            Item {
                width: 2
            }
            // Left bracket

            Rectangle {
                height: 300
                width: 25
                color: "transparent"

                WinSwitchBracket {
                    boxWidth: 23
                    boxHeight: 300
                    borderWidth: 1
                    borderColor: Colors.redx80
                    gradStart: Colors.redx40
                    gradEnd: Colors.redx70
                }

            }

            // Main panel
            Rectangle {
                width: 360
                height: 300
                color: Colors.redx10
                border.color: Colors.redx80

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 5
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 4

                        Rectangle {
                            Layout.fillWidth: true
                            height: 30
                            color: "transparent"

                            RowLayout {
                                spacing: 5
                                anchors.verticalCenter: parent.verticalCenter
                                Layout.fillWidth: true

                                Rectangle {
                                    radius: 30
                                    height: 18
                                    width: 18
                                    color: Colors.redx80

                                    Rajdhani {
                                        text: "!"
                                        uppercase: true
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        size: 20
                                        color: Colors.darkbluex
                                        fontWeight: "semibold"
                                    }

                                }

                                Rajdhani {
                                    text: "cyberdeck system app watcher"
                                    uppercase: true
                                    size: 16
                                    fontWeight: "semibold"
                                    pt: 5
                                    pl: 5
                                }

                            }

                        }

                        BorderXRed40 {
                            lineWidth: 350
                        }

                        Rectangle {
                            id: rootItem

                            Layout.fillWidth: true
                            height: 45
                            color: Colors.redx80
                            Component.onCompleted: {
                                glowAnim.start();
                            }

                            RowLayout {
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 0
                                Layout.fillWidth: true
                                anchors.fill: parent

                                SysImgText {
                                    textColor: Colors.darkbluex80
                                    size: 8
                                    pl: 5
                                    z: 2
                                }

                                FillX {
                                }

                                ColumnLayout {
                                    spacing: 0
                                    Layout.fillWidth: true

                                    Orbitron {
                                        text: "app running"
                                        uppercase: true
                                        size: 13
                                        color: Colors.darkbluex80
                                        fontWeight: "semibold"
                                    }

                                    Orbitron {
                                        text: "on workspaces"
                                        uppercase: true
                                        size: 13
                                        color: Colors.darkbluex80
                                        fontWeight: "semibold"
                                    }

                                }

                                Image {
                                    width: 38
                                    height: 34
                                    source: "../assets/images/window/win-ws-icon-alt.png"
                                    fillMode: Image.PreserveAspectFit
                                }

                                Item {
                                    width: 5
                                }

                            }

                            Rectangle {
                                id: glow

                                width: 260
                                height: 45
                                color: "transparent"
                                opacity: 0
                                x: 0
                                z: 1

                                WinSwitchButtonGlow {
                                    anchors.fill: parent
                                    boxWidth: 120
                                    boxHeight: parent.height
                                    gradAngle: 30
                                    color1: "transparent"
                                    color2: "transparent"
                                    color3: Colors.greyx30
                                    color4: Colors.greyx10
                                    color5: "transparent"
                                }

                                SequentialAnimation {
                                    id: glowAnim

                                    running: false
                                    loops: Animation.Infinite

                                    NumberAnimation {
                                        target: glow
                                        property: "opacity"
                                        from: 0
                                        to: 1
                                        duration: 1000
                                    }

                                    NumberAnimation {
                                        target: glow
                                        property: "x"
                                        from: 0
                                        to: 150
                                        duration: 1000
                                        easing.type: Easing.InOutQuad
                                    }

                                    NumberAnimation {
                                        target: glow
                                        property: "x"
                                        from: 120
                                        to: 0
                                        duration: 1000
                                        easing.type: Easing.InOutQuad
                                    }

                                    NumberAnimation {
                                        target: glow
                                        property: "opacity"
                                        from: 1
                                        to: 0
                                        duration: 1000
                                    }

                                    ScriptAction {
                                        script: {
                                            glow.x = 0;
                                            glow.opacity = 0;
                                        }
                                    }

                                }

                            }

                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 195
                            color: "transparent"

                            ListView {
                                id: listView

                                anchors.fill: parent
                                spacing: 3
                                model: winSwitchList.windows
                                focus: true
                                currentIndex: 0
                                highlightFollowsCurrentItem: true
                                highlightMoveDuration: 0
                                keyNavigationWraps: true

                                delegate: Rectangle {
                                    id: delegateRoot

                                    required property var modelData
                                    required property int index
                                    property bool hovered: false
                                    readonly property bool isActiveWindow: modelData.address === activeWin.address
                                    readonly property bool isSelected: keyboardActive ? ListView.isCurrentItem : hovered

                                    width: parent.width
                                    height: 30
                                    color: "transparent"

                                    Rectangle {
                                        id: glow

                                        width: 250
                                        height: delegateRoot.height
                                        color: "transparent"
                                        x: 0
                                        opacity: 0
                                    }

                                    WinSwitchButton {
                                        readonly property bool isActiveWindow: modelData.address === winSwitchPanelContent.activeAddress

                                        boxWidth: parent.width
                                        boxHeight: parent.height
                                        borderWidth: 1
                                        borderColor: isActiveWindow ? Colors.redx : isSelected ? Colors.redx : Colors.redx40
                                        gradStart: isActiveWindow ? Colors.greenx80 : isSelected ? Colors.redx80 : Colors.redx10
                                        gradEnd: gradStart
                                    }

                                    RowLayout {
                                        Layout.fillWidth: true
                                        anchors.verticalCenter: parent.verticalCenter
                                        spacing: 5

                                        Image {
                                            width: 28
                                            height: 26
                                            fillMode: Image.PreserveAspectFit
                                            source: isSelected ? "../assets/images/window/win-sel-icon.png" : "../assets/images/window/win-seln-icon.png"
                                        }

                                        Rectangle {
                                            width: 330
                                            height: 30
                                            color: "transparent"

                                            Text {
                                                text: ((modelData.class ?? "NOCLASS") + " — " + (modelData.title ?? "NOTITLE")).toUpperCase()
                                                color: isActiveWindow ? Colors.redx : isSelected ? Colors.cyanx : Colors.redx
                                                width: parent.width - 40
                                                font.family: "Rajdhani"
                                                topPadding: 5
                                                font.weight: Font.DemiBold
                                                font.pixelSize: 14
                                                elide: Text.ElideRight
                                            }

                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            hovered = true;
                                            keyboardActive = false;
                                        }
                                        onExited: hovered = false
                                        onClicked: {
                                            focusHelper.focusWindow(modelData);
                                            GlobalState.closeWinSwitch();
                                        }
                                    }

                                }

                            }

                        }

                    }

                }

            }

        }

    }

}
