import Qt5Compat.GraphicalEffects
import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.Pipewire
import Quickshell.Wayland
import qs.components.common
import qs.components.icons
import qs.components.panel.level
import qs.components.panel.network
import qs.components.preset
import qs.components.slider
import qs.components.typography
import qs.content
import qs.popup
import qs.services
import qs.state
import qs.styles

Rectangle {
    id: levelPanel

    property var screenPresets: []

    function updateScreenPresets() {
        const fm = Hyprland.focusedMonitor;
        if (!fm)
            return ;

        screenPresets = [{
            "label": fm.name + " " + fm.width + "x" + fm.height,
            "value": fm.name
        }];
    }

    Component.onCompleted: {
        updateScreenPresets();
    }
    color: "transparent"
    implicitWidth: 670
    implicitHeight: 470
    focus: false

    Process {
        id: wpctlSetProc
    }

    Brightness {
        id: brightness
    }

    Volume {
        id: masterVolume
    }

    QsVolume {
        id: qsVolume
    }

    MpdVolume {
        id: mpdVolume
    }

    AudioPreset {
        id: audioPresetItem
    }

    SoundEffect {
        id: hoverSound

        source: "../assets/fx/hover.wav"
    }

    Connections {
        function onFocusedMonitorChanged() {
            updateScreenPresets();
        }

        target: Hyprland
    }

    ColumnLayout {
        spacing: 0

        Rectangle {
            height: 470
            color: "transparent"
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                id: rootBg

                anchors.verticalCenter: parent.verticalCenter
                spacing: 0
                Layout.fillWidth: true
                Layout.fillHeight: true

                NetLeftBracket {
                    boxWidth: 10
                    boxHeight: 350
                    bgColor: Colors.redx80
                    borderColor: "transparent"
                    borderWidth: 0
                    Layout.alignment: Qt.AlignBottom
                }

                Rectangle {
                    id: netContent

                    color: Colors.darkbluex
                    border.color: Colors.redx80
                    Layout.preferredWidth: 670
                    Layout.preferredHeight: 470
                    layer.enabled: true
                    layer.smooth: true

                    RowLayout {
                        spacing: 0

                        Rectangle {
                            width: 4
                            height: 470
                            color: "transparent"
                        }

                        Rectangle {
                            id: netMain

                            width: 660
                            height: 470
                            color: "transparent"

                            ColumnLayout {
                                spacing: 2
                                Layout.fillWidth: true

                                Rectangle {
                                    height: 4
                                }

                                RowLayout {
                                    Layout.fillWidth: true
                                    spacing: 0

                                    Orbitron {
                                        text: "panel"
                                        size: Texts.xxxs
                                        color: Colors.redx40
                                        fontWeight: "semibold"
                                        uppercase: true
                                    }

                                    FillX {
                                    }

                                    Orbitron {
                                        text: "Controller"
                                        size: Texts.xxxs
                                        color: Colors.redx40
                                        fontWeight: "semibold"
                                        uppercase: true
                                    }

                                }

                                BorderXRed40GridLong {
                                    lineWidth: netMain.width
                                }

                                Rectangle {
                                    height: 4
                                }

                                BorderXRed40GridLong {
                                    lineWidth: netMain.width
                                }

                                Rajdhani {
                                    text: "Audio Controller"
                                    size: Texts.sm
                                    color: Colors.greyx
                                    fontWeight: "medium"
                                }

                                Rectangle {
                                    id: audioPreset

                                    property bool hoveredAudioPreset: false

                                    width: netMain.width
                                    height: 36
                                    color: "transparent"
                                    border.color: "transparent"

                                    RowLayout {
                                        z: 0
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        opacity: audioPreset.hoveredAudioPreset ? 1 : 0

                                        Rectangle {
                                            height: 8
                                            width: 250
                                            Layout.alignment: Qt.AlignVCenter

                                            gradient: Gradient {
                                                orientation: Gradient.Horizontal

                                                GradientStop {
                                                    position: 0
                                                    color: "transparent"
                                                }

                                                GradientStop {
                                                    position: 0.5
                                                    color: Colors.greyx10
                                                }

                                                GradientStop {
                                                    position: 1
                                                    color: "transparent"
                                                }

                                            }

                                        }

                                    }

                                    RowLayout {
                                        z: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.fill: parent
                                        anchors.margins: 4
                                        spacing: 8

                                        Rajdhani {
                                            text: "Preset"
                                            size: Texts.sm
                                            color: audioPreset.hoveredAudioPreset ? Colors.greyx : Colors.redx
                                        }

                                        FillX {
                                        }

                                        Preset {
                                            id: audioPresetControl

                                            presets: audioPresetItem.audioPresets.map((p) => {
                                                return ({
                                                    "label": p.label,
                                                    "value": p.id
                                                });
                                            })
                                            onPresetChanged: (_, sinkId) => {
                                                console.log("[UI] change audio sink to", sinkId);
                                                wpctlSetProc.command = ["sh", "-c", `wpctl set-default ${sinkId}`];
                                                wpctlSetProc.running = true;
                                            }
                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            audioPreset.hoveredAudioPreset = true;
                                            hoverSound.play();
                                        }
                                        onExited: audioPreset.hoveredAudioPreset = false
                                    }

                                }

                                Rectangle {
                                    id: audioToggle

                                    property bool hoverAudioToggle: false

                                    width: netMain.width
                                    height: 36
                                    color: "transparent"
                                    border.color: "transparent"

                                    RowLayout {
                                        z: 0
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        opacity: audioToggle.hoverAudioToggle ? 1 : 0

                                        Rectangle {
                                            height: 8
                                            width: 250
                                            Layout.alignment: Qt.AlignVCenter

                                            gradient: Gradient {
                                                orientation: Gradient.Horizontal

                                                GradientStop {
                                                    position: 0
                                                    color: "transparent"
                                                }

                                                GradientStop {
                                                    position: 0.5
                                                    color: Colors.greyx10
                                                }

                                                GradientStop {
                                                    position: 1
                                                    color: "transparent"
                                                }

                                            }

                                        }

                                    }

                                    RowLayout {
                                        z: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.fill: parent
                                        anchors.margins: 4
                                        spacing: 8

                                        Rajdhani {
                                            text: "Enable Controller Speaker"
                                            size: Texts.sm
                                            color: audioToggle.hoverAudioToggle ? Colors.greyx : Colors.redx
                                        }

                                        FillX {
                                        }

                                        Rajdhani {
                                            text: speakerToggle.checked ? "on" : "off"
                                            size: Texts.xs
                                            uppercase: true
                                            color: speakerToggle.checked ? Colors.cyanx : Colors.greyx
                                        }

                                        ToggleSwitch {
                                            id: speakerToggle

                                            checked: true
                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            audioToggle.hoverAudioToggle = true;
                                            hoverSound.play();
                                        }
                                        onExited: audioToggle.hoverAudioToggle = false
                                    }

                                }

                                BorderXRed40GridLong {
                                    lineWidth: netMain.width
                                }

                                Rectangle {
                                    id: mixerEntry

                                    height: 170
                                    width: netMain.width
                                    color: "transparent"

                                    ColumnLayout {
                                        spacing: 5
                                        width: netMain.width
                                        visible: speakerToggle.checked
                                        opacity: speakerToggle.checked ? 1 : 0
                                        height: speakerToggle.checked ? implicitHeight : 0
                                        clip: true

                                        Rectangle {
                                            id: masterLevel

                                            property bool hoverMasterLevel: false

                                            height: 25
                                            width: 660
                                            color: "transparent"

                                            MouseArea {
                                                anchors.fill: masterLevel
                                                hoverEnabled: true
                                                cursorShape: Qt.PointingHandCursor
                                                onEntered: {
                                                    masterLevel.hoverMasterLevel = true;
                                                    hoverSound.play();
                                                }
                                                onExited: masterLevel.hoverMasterLevel = false
                                            }

                                            RowLayout {
                                                anchors.fill: masterLevel
                                                spacing: 0
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true

                                                Rectangle {
                                                    height: 8
                                                    color: "transparent"
                                                    opacity: masterLevel.hoverMasterLevel ? 1 : 0

                                                    Rectangle {
                                                        height: 8
                                                        width: 250
                                                        Layout.alignment: Qt.AlignVCenter

                                                        gradient: Gradient {
                                                            orientation: Gradient.Horizontal

                                                            GradientStop {
                                                                position: 0
                                                                color: "transparent"
                                                            }

                                                            GradientStop {
                                                                position: 0.5
                                                                color: Colors.greyx10
                                                            }

                                                            GradientStop {
                                                                position: 1
                                                                color: "transparent"
                                                            }

                                                        }

                                                    }

                                                    Behavior on opacity {
                                                        NumberAnimation {
                                                            duration: 160
                                                        }

                                                    }

                                                }

                                                Rajdhani {
                                                    size: Texts.sm
                                                    pl: 4
                                                    text: "Master Level"
                                                    color: masterLevel.hoverMasterLevel ? Colors.greyx : Colors.redx
                                                }

                                                FillX {
                                                }

                                                Rectangle {
                                                    height: 25
                                                }

                                                Rectangle {
                                                    width: 220
                                                    height: 24
                                                    color: "transparent"

                                                    Slider {
                                                        value: masterVolume.level / 100
                                                        onMoved: (v) => {
                                                            masterVolume.setVolume(Math.round(v * 100));
                                                        }
                                                    }

                                                }

                                            }

                                        }

                                        Rectangle {
                                            id: qsLevel

                                            property bool hoverQsLevel: false

                                            height: 25
                                            width: 660
                                            color: "transparent"

                                            MouseArea {
                                                anchors.fill: qsLevel
                                                hoverEnabled: true
                                                cursorShape: Qt.PointingHandCursor
                                                onEntered: {
                                                    qsLevel.hoverQsLevel = true;
                                                    hoverSound.play();
                                                }
                                                onExited: qsLevel.hoverQsLevel = false
                                            }

                                            RowLayout {
                                                anchors.fill: qsLevel
                                                spacing: 0
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true

                                                Rectangle {
                                                    height: 8
                                                    color: "transparent"
                                                    opacity: qsLevel.hoverQsLevel ? 1 : 0

                                                    Rectangle {
                                                        height: 8
                                                        width: 250
                                                        Layout.alignment: Qt.AlignVCenter

                                                        gradient: Gradient {
                                                            orientation: Gradient.Horizontal

                                                            GradientStop {
                                                                position: 0
                                                                color: "transparent"
                                                            }

                                                            GradientStop {
                                                                position: 0.5
                                                                color: Colors.greyx10
                                                            }

                                                            GradientStop {
                                                                position: 1
                                                                color: "transparent"
                                                            }

                                                        }

                                                    }

                                                    Behavior on opacity {
                                                        NumberAnimation {
                                                            duration: 160
                                                        }

                                                    }

                                                }

                                                Rajdhani {
                                                    size: Texts.sm
                                                    pl: 4
                                                    text: "FX"
                                                    color: qsLevel.hoverQsLevel ? Colors.greyx : Colors.redx
                                                }

                                                FillX {
                                                }

                                                Rectangle {
                                                    height: 25
                                                }

                                                Rectangle {
                                                    width: 220
                                                    height: 24
                                                    color: "transparent"

                                                    Slider {
                                                        value: qsVolume.level / 100
                                                        onMoved: (v) => {
                                                            qsVolume.setVolume(Math.round(v * 100));
                                                        }
                                                    }

                                                }

                                            }

                                        }

                                        Rectangle {
                                            id: mpdLevel

                                            property bool hoverMpdLevel: false

                                            height: 25
                                            width: 660
                                            color: "transparent"

                                            MouseArea {
                                                anchors.fill: mpdLevel
                                                hoverEnabled: true
                                                cursorShape: Qt.PointingHandCursor
                                                onEntered: {
                                                    mpdLevel.hoverMpdLevel = true;
                                                    hoverSound.play();
                                                }
                                                onExited: mpdLevel.hoverMpdLevel = false
                                            }

                                            RowLayout {
                                                anchors.fill: mpdLevel
                                                spacing: 0
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true

                                                Rectangle {
                                                    height: 8
                                                    color: "transparent"
                                                    opacity: mpdLevel.hoverMpdLevel ? 1 : 0

                                                    Rectangle {
                                                        height: 8
                                                        width: 250
                                                        Layout.alignment: Qt.AlignVCenter

                                                        gradient: Gradient {
                                                            orientation: Gradient.Horizontal

                                                            GradientStop {
                                                                position: 0
                                                                color: "transparent"
                                                            }

                                                            GradientStop {
                                                                position: 0.5
                                                                color: Colors.greyx10
                                                            }

                                                            GradientStop {
                                                                position: 1
                                                                color: "transparent"
                                                            }

                                                        }

                                                    }

                                                    Behavior on opacity {
                                                        NumberAnimation {
                                                            duration: 160
                                                        }

                                                    }

                                                }

                                                Rajdhani {
                                                    size: Texts.sm
                                                    pl: 4
                                                    text: "Radiostation"
                                                    color: mpdLevel.hoverMpdLevel ? Colors.greyx : Colors.redx
                                                }

                                                FillX {
                                                }

                                                Rectangle {
                                                    height: 25
                                                }

                                                Rectangle {
                                                    width: 220
                                                    height: 24
                                                    color: "transparent"

                                                    Slider {
                                                        value: mpdVolume.level / 100
                                                        onMoved: (v) => {
                                                            mpdVolume.setVolume(Math.round(v * 100));
                                                        }
                                                    }

                                                }

                                            }

                                        }

                                    }

                                }

                                BorderXRed40GridLong {
                                    lineWidth: netMain.width
                                }

                                Rajdhani {
                                    text: "Screen Controller"
                                    size: Texts.sm
                                    color: Colors.greyx
                                    fontWeight: "medium"
                                }

                                Rectangle {
                                    id: screenPreset

                                    property bool hoverScreenPreset: false

                                    width: netMain.width
                                    height: 36
                                    color: "transparent"
                                    border.color: "transparent"

                                    RowLayout {
                                        z: 0
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        opacity: screenPreset.hoverScreenPreset ? 1 : 0

                                        Rectangle {
                                            height: 8
                                            width: 250
                                            Layout.alignment: Qt.AlignVCenter

                                            gradient: Gradient {
                                                orientation: Gradient.Horizontal

                                                GradientStop {
                                                    position: 0
                                                    color: "transparent"
                                                }

                                                GradientStop {
                                                    position: 0.5
                                                    color: Colors.greyx10
                                                }

                                                GradientStop {
                                                    position: 1
                                                    color: "transparent"
                                                }

                                            }

                                        }

                                        Behavior on opacity {
                                            NumberAnimation {
                                                duration: 160
                                            }

                                        }

                                    }

                                    RowLayout {
                                        z: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.fill: parent
                                        anchors.margins: 4
                                        spacing: 8

                                        Rajdhani {
                                            text: "Preset"
                                            size: Texts.sm
                                            color: screenPreset.hoverScreenPreset ? Colors.greyx : Colors.redx
                                        }

                                        FillX {
                                        }

                                        Preset {
                                            presets: screenPresets
                                            onPresetChanged: (_, monitorName) => {
                                                Hyprland.dispatch("focusmonitor", monitorName);
                                            }
                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            screenPreset.hoverScreenPreset = true;
                                            hoverSound.play();
                                        }
                                        onExited: screenPreset.hoverScreenPreset = false
                                    }

                                }

                                Rectangle {
                                    id: screensToggle

                                    property bool hoverScreensToggle: false

                                    width: netMain.width
                                    height: 36
                                    color: "transparent"
                                    border.color: "transparent"

                                    RowLayout {
                                        z: 0
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        opacity: screensToggle.hoverScreensToggle ? 1 : 0

                                        Rectangle {
                                            height: 8
                                            width: 250
                                            Layout.alignment: Qt.AlignVCenter

                                            gradient: Gradient {
                                                orientation: Gradient.Horizontal

                                                GradientStop {
                                                    position: 0
                                                    color: "transparent"
                                                }

                                                GradientStop {
                                                    position: 0.5
                                                    color: Colors.greyx10
                                                }

                                                GradientStop {
                                                    position: 1
                                                    color: "transparent"
                                                }

                                            }

                                        }

                                        Behavior on opacity {
                                            NumberAnimation {
                                                duration: 160
                                            }

                                        }

                                    }

                                    RowLayout {
                                        z: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.fill: parent
                                        anchors.margins: 4
                                        spacing: 8

                                        Rajdhani {
                                            text: "Enable Controller Screen"
                                            size: Texts.sm
                                            color: screensToggle.hoverScreensToggle ? Colors.greyx : Colors.redx
                                        }

                                        FillX {
                                        }

                                        Rajdhani {
                                            text: "on"
                                            size: Texts.xs
                                            uppercase: true
                                            color: Colors.greyx
                                        }

                                        ToggleSwitch {
                                            id: screenToggle

                                            checked: true
                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            screensToggle.hoverScreensToggle = true;
                                            hoverSound.play();
                                        }
                                        onExited: screensToggle.hoverScreensToggle = false
                                    }

                                }

                                BorderXRed40GridLong {
                                    lineWidth: netMain.width
                                }

                                Rectangle {
                                    id: screensSlider

                                    property bool hoverScreensSlider: false

                                    width: netMain.width
                                    height: 36
                                    color: "transparent"
                                    border.color: "transparent"

                                    RowLayout {
                                        z: 0
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        opacity: screensSlider.hoverScreensSlider ? 1 : 0

                                        Rectangle {
                                            height: 8
                                            width: 250
                                            Layout.alignment: Qt.AlignVCenter

                                            gradient: Gradient {
                                                orientation: Gradient.Horizontal

                                                GradientStop {
                                                    position: 0
                                                    color: "transparent"
                                                }

                                                GradientStop {
                                                    position: 0.5
                                                    color: Colors.greyx10
                                                }

                                                GradientStop {
                                                    position: 1
                                                    color: "transparent"
                                                }

                                            }

                                        }

                                        Behavior on opacity {
                                            NumberAnimation {
                                                duration: 160
                                            }

                                        }

                                    }

                                    RowLayout {
                                        visible: screenToggle.checked
                                        opacity: screenToggle.checked ? 1 : 0
                                        height: screenToggle.checked ? implicitHeight : 0
                                        z: 1
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.fill: parent
                                        anchors.margins: 4
                                        spacing: 8

                                        Rajdhani {
                                            text: "Screen Light"
                                            size: Texts.sm
                                            color: screensSlider.hoverScreensSlider ? Colors.greyx : Colors.redx
                                        }

                                        FillX {
                                        }

                                        Rectangle {
                                            width: 220
                                            height: 24
                                            color: "transparent"

                                            Slider {
                                                value: brightness.brightness / 100
                                                onMoved: (v) => {
                                                    brightness.updateBrightness(Math.round(v * 100));
                                                }
                                            }

                                        }

                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onEntered: {
                                            screensSlider.hoverScreensSlider = true;
                                            hoverSound.play();
                                        }
                                        onExited: screensSlider.hoverScreensSlider = false
                                    }

                                }

                            }

                        }

                        Rectangle {
                            width: 4
                            height: 470
                            color: "transparent"
                        }

                    }

                    layer.effect: DropShadow {
                        samples: 17
                        source: netContent
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 6
                        color: Colors.redx
                    }

                }

                NetRightBracket {
                    boxWidth: 15
                    boxHeight: 470
                    bgColor: Colors.redx80
                    borderColor: "transparent"
                    borderWidth: 0
                }

            }

        }

        Rectangle {
            height: 30
            color: "transparent"
            width: 670

            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignTop
                width: 670
                Layout.preferredHeight: 30

                SysImgText {
                }

                FillX {
                }

                Rectangle {
                    width: netExit.implicitWidth
                    height: netExit.implicitHeight
                    color: "transparent"

                    PanelActionOutLabel {
                        id: netExit

                        keyText: "ESC"
                        labelText: "CLose"
                    }

                }

            }

        }

    }

}
