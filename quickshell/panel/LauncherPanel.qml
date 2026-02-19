import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.components.wrapper
import qs.content
import qs.state

PanelWindow {
    id: launcher

    required property var screen
    property bool anyPanelActive: GlobalState.launcherActive

    WlrLayershell.keyboardFocus: GlobalState.launcherActive
    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: anyPanelActive ? Math.min(launcherContentColumn.implicitWidth, 400) : 0
    implicitHeight: 678
    onAnyPanelActiveChanged: {
        anyPanelActive ? launchIns.play() : launchOut.play();
    }
    Component.onDestruction: {
        launchOut.stop();
        launchIns.stop();
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
        left: true
    }

    IpcHandler {
        function toggle() {
            GlobalState.toggleLauncher();
        }

        target: "launcher"
    }

    ColumnLayout {
        id: launcherContentColumn

        anchors.fill: parent
        anchors.leftMargin: 20
        spacing: 0

        Rectangle {
            height: 70
        }

        LauncherWrapper {
            active: GlobalState.launcherActive
            panelWidth: 400
            panelHeight: 678

            LauncherContent {
                onRequestClose: GlobalState.toggleLauncher()
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
