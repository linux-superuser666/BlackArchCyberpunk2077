import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Wayland
import qs.components.common
import qs.components.wrapper
import qs.content
import qs.state
import qs.styles as Styles

PanelWindow {
    id: radiostation

    required property var screen
    property bool anyPanelActive: GlobalState.radioStationActive

    visible: anyPanelActive
    screen: screen
    color: Styles.Colors.redx10
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: anyPanelActive
    implicitWidth: anyPanelActive ? Math.min(radioStationContentColumn.implicitWidth, 1366) : 0
    implicitHeight: anyPanelActive ? Math.min(radioStationContentColumn.implicitHeight, 768) : 0
    onAnyPanelActiveChanged: {
        anyPanelActive ? radioStationIn.play() : radioStationOut.play();
        if (anyPanelActive)
            rootFocus.forceActiveFocus();

    }

    SoundEffect {
        id: radioStationOut

        source: "../assets/fx/notify-out.wav"
        volume: 0.8
    }

    SoundEffect {
        id: radioStationIn

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
            GlobalState.toggleRadioStation();
        }

        target: "radiostation"
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
                GlobalState.closeRadioStation();
                event.accepted = true;
                break;
            }
        }

        Rectangle {
            width: 1366
            height: 768
            color: Styles.Colors.darkbluex30

            ColumnLayout {
                id: radioStationContentColumn

                anchors.centerIn: parent
                spacing: 0

                RadioStationWrapper {
                    active: GlobalState.radioStationActive
                    panelHeight: 520

                    RadioStationContent {
                        id: radioContent
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
