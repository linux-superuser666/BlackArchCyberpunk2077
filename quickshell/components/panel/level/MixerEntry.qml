import QtQuick
import QtQuick
import QtQuick.Controls
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.components.common
import qs.components.slider
import qs.components.typography
import qs.styles


ColumnLayout {
    required property PwNode node;
    PwObjectTracker { objects: [ node ] }

    RowLayout {
        // Icon and Application Name
        Image {
            source: {
                const icon = node.properties["application.icon-name"] ?? "audio-volume-high-symbolic";
                return `image://icon/${icon}`;
            }
            sourceSize.width: 20; sourceSize.height: 20;
        }
        Label {
            text: node.properties["application.name"] ?? node.name;
        }
        // Mute Button
        Button {
            text: node.audio.muted ? "Unmute" : "Mute"
            onClicked: node.audio.muted = !node.audio.muted
        }
    }

    RowLayout {
        // Percentage Label
        Label {
            text: `${Math.floor(node.audio.volume * 100)}%`
        }
        // Custom Slider
        Slider {
            Layout.fillWidth: true;
            value: node.audio.volume;
            onMoved: node.audio.volume = value; // Update volume on move
        }
    }
}




ColumnLayout {
    id: mixerEntry

    required property PwNode node
    property bool hoveredEntry: false

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onEntered: {
            mixerEntry.hoveredEntry = true;
            hoverSound.play();
        }
        onExited: mixerEntry.hoveredEntry = false
    }

    PwObjectTracker {
        objects: [node]
    }

    Image {
        source: {
            const icon = node.properties["application.icon-name"] ?? "audio-volume-high-symbolic";
            return `image://icon/${icon}`;
        }
        sourceSize.width: 20
        sourceSize.height: 20
    }

    RowLayout {
        spacing: 0

        Rectangle {
            height: 8
            color: "transparent"
            opacity: mixerEntry.hoveredEntry ? 1 : 0

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
            text: node && node.properties ? (node.properties["application.name"] ?? (node.description != "" ? node.description : node.name)) : "Loading..."
            color: Colors.redx
        }

        FillX {
        }

        Rectangle {
            height: 25
        }

        Rectangle {
            width: 220
            height: 22
            color: "transparent"

            Slider {
                value: node.audio.volume
                onValueChanged: node.audio.volume = value
            }

        }

    }

}
