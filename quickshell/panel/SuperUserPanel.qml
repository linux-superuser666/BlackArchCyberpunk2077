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
import qs.styles as Styles

PanelWindow {
    id: superUser

    required property var screen
    property bool anyPanelActive: GlobalState.superUserActive

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: anyPanelActive ? Math.min(superuserContentColumn.implicitWidth, 550) : 0
    implicitHeight: 500
    onAnyPanelActiveChanged: {
        anyPanelActive ? sysIn.play() : sysOut.play();
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

    anchors {
        right: true
        bottom: true
    }

    Rectangle {
        Layout.preferredWidth: superuserContentColumn.implicitWidth
        Layout.preferredHeight: 500
        color: "transparent"

        RowLayout {
            id: superuserContentColumn

            spacing: 0

            PanelRightWrapper {
                active: GlobalState.superUserActive
                panelHeight: 400

                SuperUserPanelContent {
                }

            }

        }

    }

}
