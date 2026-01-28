import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.wrapper
import qs.content
import qs.state

PanelWindow {
    id: winSwitchPanel

    property bool anyPanelActive: GlobalState.winSwitchActive
    required property var screen

    visible: anyPanelActive
    WlrLayershell.keyboardFocus: GlobalState.winSwitchActive
    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Overlay
    implicitWidth: anyPanelActive ? Math.min(winSwitchContentColumn.implicitWidth, 400) : 0
    implicitHeight: anyPanelActive ? Math.min(winSwitchContentColumn.implicitHeight, 300) : 0
    onAnyPanelActiveChanged: {
        anyPanelActive ? launchIns.play() : launchOut.play();
    }

    SoundEffect {
        id: launchOut

        source: "../assets/fx/notify-out.wav"
        volume: 0.8
    }

    SoundEffect {
        id: launchIns

        source: "../assets/fx/notify-in.wav"
        volume: 0.8
    }

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    IpcHandler {
        function toggle() {
            GlobalState.toggleWinSwitch();
        }

        target: "winswitch"
    }

    FocusScope {
        id: rootFocus

        anchors.fill: parent
        focus: true
        Keys.onPressed: (event) => {
            if (!anyPanelActive)
                return ;

            switch (event.key) {
            case Qt.Key_C:
            case Qt.Key_Escape:
                GlobalState.closeWinSwitch();
                event.accepted = true;
                break;
            }
        }

        ColumnLayout {
            id: winSwitchContentColumn

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0

            WinSwitchPanelWrapper {
                active: GlobalState.winSwitchActive
                panelWidth: 440
                panelHeight: 360

                WinSwitchPanelContent {
                }

            }

        }

    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 260
            easing.type: Easing.OutCubic
        }

    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 260
            easing.type: Easing.OutCubic
        }

    }

}
