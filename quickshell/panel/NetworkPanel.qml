import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.wrapper
import qs.content
import qs.state

PanelWindow {
    id: network

    required property var screen
    property bool anyPanelActive: GlobalState.networkActive

    visible: anyPanelActive
    WlrLayershell.keyboardFocus: GlobalState.networkActive
    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: anyPanelActive ? Math.min(networkContentColumn.implicitWidth, 700) : 0
    implicitHeight: 500
    onAnyPanelActiveChanged: {
        anyPanelActive ? sysIn.play() : sysOut.play();
    }

    anchors {
        right: true
        top: true
        left: true
        bottom: true
    }

    SoundEffect {
        id: sysOut

        source: "../assets/fx/notify-out.wav"
        volume: 0.8
    }

    SoundEffect {
        id: sysIn

        source: "../assets/fx/notify-in.wav"
    }

    IpcHandler {
        function toggle() {
            GlobalState.toggleNetwork();
        }

        target: "network"
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
                GlobalState.closeNetwork();
                event.accepted = true;
                break;
            }
        }

        ColumnLayout {
            id: networkContentColumn

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0

            NetworkPanelWrapper {
                active: GlobalState.networkActive
                panelWidth: 700
                panelHeight: 500

                NetworkPanelContent {
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

}
