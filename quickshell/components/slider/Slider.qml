import QtQuick
import QtQuick.Layouts
import qs.components.common
import qs.components.icons
import qs.components.typography
import qs.styles

Item {
    id: slider

    property real value: 0
    property real step: 0.05
    property real minValue: 0
    property real maxValue: 1
    property color borderColor: Colors.redx40

    signal moved(real value)

    function clamp(v) {
        return Math.max(minValue, Math.min(maxValue, v));
    }

    function setValue(v) {
        value = clamp(v);
        moved(value);
    }

    width: 220
    height: 22
    onValueChanged: {
        value = clamp(value);
    }

    SliderFrame {
        anchors.fill: parent
        bgColor: Colors.darkbluex
        borderColor: slider.borderColor
        borderWidth: 1
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            width: 4
        }

        Item {
            width: 10
            height: 9

            Cevron {
                anchors.fill: parent
                direction: "left"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: slider.setValue(slider.value - slider.step)
            }

        }

        Item {
            id: body

            readonly property real minX: 4
            readonly property real maxX: width - knob.width - 4

            Layout.fillWidth: true
            height: slider.height

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - 20
                height: 2
                radius: 1
                color: Colors.greyx10
            }

            Item {
                id: knob

                width: 36
                height: 18
                y: (parent.height - height) / 2
                x: body.minX + (body.maxX - body.minX) * slider.value

                SliderKnob {
                    anchors.fill: parent
                }

                Rajdhani {
                    anchors.centerIn: parent
                    text: Math.round(slider.value * 100)
                    size: Texts.sm
                    color: Colors.greyx
                }

                Behavior on x {
                    NumberAnimation {
                        duration: 140
                        easing.type: Easing.OutCubic
                    }

                }

            }

            MouseArea {
                function update(mx) {
                    const pos = mx - knob.width / 2;
                    const v = (pos - body.minX) / (body.maxX - body.minX);
                    slider.setValue(v);
                }

                anchors.fill: parent
                onPressed: update(mouseX)
                onPositionChanged: {
                    if (pressed)
                        update(mouseX);

                }
            }

        }

        Item {
            width: 10
            height: 9

            Cevron {
                anchors.fill: parent
                direction: "right"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: slider.setValue(slider.value + slider.step)
            }

        }

        Item {
            width: 4
        }

    }

}
