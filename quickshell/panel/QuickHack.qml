import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.wrapper
import qs.content
import qs.state
import qs.styles as Styles

PanelWindow {
    id: quickhack

    required property var screen
    property bool anyPanelActive: GlobalState.quickHackActive

    WlrLayershell.keyboardFocus: anyPanelActive
    visible: anyPanelActive
    screen: screen
    color: Styles.Colors.redx10
    WlrLayershell.layer: WlrLayer.Overlay
    implicitWidth: anyPanelActive ? Math.min(quickHackContentColumn.implicitWidth, 1366) : 0
    implicitHeight: anyPanelActive ? Math.min(quickHackContentColumn.implicitHeight, 768) : 0
    onAnyPanelActiveChanged: {
        anyPanelActive ? quickHackIn.play() : quickHackOut.play();
    }

    SoundEffect {
        id: quickHackOut

        source: "../assets/fx/notify-out.wav"
        volume: 0.8
    }

    SoundEffect {
        id: quickHackIn

        source: "../assets/fx/notify-in.wav"
    }

    anchors {
        top: true
        right: true
        bottom: true
        left: true
    }

    IpcHandler {
        function toggle() {
            GlobalState.toggleQuickHack();
        }

        target: "quickhack"
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
                GlobalState.closeQuickHack();
                event.accepted = true;
                break;
            }
        }

        Rectangle {
            width: 1366
            height: 768
            color: Styles.Colors.darkbluex80

            ColumnLayout {
                id: quickHackContentColumn

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 0

                RadioStationWrapper {
                    active: GlobalState.quickHackActive
                    panelWidth: 1270
                    panelHeight: 610

                    QuickHackPanelContent {
                    }

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
