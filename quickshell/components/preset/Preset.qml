import QtQuick
import QtQuick.Layouts
import qs.components.icons
import qs.components.preset
import qs.components.typography
import qs.styles

Item {
    id: root

    // ===== PUBLIC API =====
    property int presetWidth: 220
    property int presetHeight: 22
    property color borderColor: Colors.redx40
    // preset data: [{ label: string, value: any }]
    property var presets
    readonly property var safePresets: Array.isArray(presets) ? presets : []
    property int presetIndex: 0
    readonly property var value: safePresets.length > 0 && safePresets[presetIndex] ? safePresets[presetIndex].value : null

    signal presetChanged(int index, var value)

    // ===== LOGIC =====
    function clampIndex(i) {
        return Math.max(0, Math.min(safePresets.length - 1, i));
    }

    function setPreset(i) {
        if (safePresets.length === 0)
            return ;

        const ni = clampIndex(i);
        if (ni !== presetIndex) {
            presetIndex = ni;
            presetChanged(presetIndex, value);
        }
    }

    onPresetsChanged: {
        if (safePresets.length === 0) {
            presetIndex = 0;
            return ;
        }
        if (presetIndex < 0 || presetIndex >= safePresets.length)
            presetIndex = 0;

    }
    width: presetWidth
    height: presetHeight

    // ===== FRAME =====
    PresetFrame {
        anchors.fill: parent
        bgColor: Colors.darkbluex
        borderColor: root.borderColor
        borderWidth: 1
    }

    // ===== CONTENT =====
    RowLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            width: 4
        }

        // ===== LEFT CHEVRON =====
        Item {
            width: 10
            height: 9

            Cevron {
                anchors.fill: parent
                direction: "left"
                enabled: safePresets.length > 0
                opacity: presetIndex > 0 ? 1 : 0.3
            }

            MouseArea {
                anchors.fill: parent
                enabled: presetIndex > 0
                cursorShape: Qt.PointingHandCursor
                onClicked: root.setPreset(root.presetIndex - 1)
            }

        }

        // ===== CENTER DISPLAY =====
        Item {
            Layout.fillWidth: true
            height: root.height

            Item {
                width: 120
                height: 18
                anchors.centerIn: parent
                visible: safePresets.length > 0

                Rajdhani {
                    anchors.centerIn: parent
                    text: safePresets.length > 0 ? safePresets[presetIndex].label : ""
                    size: Texts.sm
                    fontWeight: "medium"
                    color: Colors.greyx
                }

            }

            // click anywhere = next preset
            MouseArea {
                anchors.fill: parent
                enabled: safePresets.length > 1
                cursorShape: Qt.PointingHandCursor
                onClicked: root.setPreset(root.presetIndex + 1)
            }

        }

        // ===== RIGHT CHEVRON =====
        Item {
            width: 10
            height: 9

            Cevron {
                anchors.fill: parent
                direction: "right"
                enabled: safePresets.length > 0
                opacity: presetIndex < safePresets.length - 1 ? 1 : 0.3
            }

            MouseArea {
                anchors.fill: parent
                enabled: presetIndex < safePresets.length - 1
                cursorShape: Qt.PointingHandCursor
                onClicked: root.setPreset(root.presetIndex + 1)
            }

        }

        Item {
            width: 4
        }

    }

}
