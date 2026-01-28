import Qt5Compat.GraphicalEffects
import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import Quickshell.Widgets
import qs.components.common
import qs.components.panel.notify
import qs.components.typography
import qs.styles

Rectangle {
    color: "transparent"
    width: 325
    height: 260

    ColumnLayout {
        spacing: 5
        Layout.alignment: Qt.AlignLeft | Qt.AlignTop

        Rectangle {
            id: panelNotif

            color: "transparent"
            width: 325
            height: 260

            RowLayout {
                anchors.fill: parent
                spacing: 5

                Rectangle {
                    Layout.preferredWidth: 20
                    Layout.alignment: Qt.AlignTop
                    color: "transparent"

                    ColumnLayout {
                        spacing: 10

                        Rectangle {
                            width: 24
                            height: 25
                            color: "transparent"

                            BinLinesState {
                            }

                        }

                        Rectangle {
                            width: 25
                            height: 14
                            color: "transparent"

                            Image {
                                id: panelNotifC

                                width: 25
                                height: 21
                                source: "../assets/icons/origin-dbus.png"
                                //source: "../assets/icons/mail-dbus.png"
                                fillMode: Image.PreserveAspectFit
                            }

                            SequentialAnimation {
                                loops: Animation.Infinite
                                running: true

                                ParallelAnimation {
                                    PropertyAnimation {
                                        target: panelNotifC
                                        property: "opacity"
                                        from: 1
                                        to: 0
                                        duration: 1000
                                        easing.type: Easing.InOutQuad
                                    }

                                }

                                ParallelAnimation {
                                    PropertyAnimation {
                                        target: panelNotifC
                                        property: "opacity"
                                        from: 0
                                        to: 1
                                        duration: 1000
                                        easing.type: Easing.InOutQuad
                                    }

                                }

                            }

                        }

                    }

                }

                // ===== KANAN (TEXT) =====
                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop
                    color: "transparent"

                    ColumnLayout {
                        ///content

                        anchors.fill: parent
                        spacing: 5

                        Orbitron {
                            size: 8
                            color: Colors.redx70
                            text: "CONNECTION_D-BUS 1.001.1"
                        }

                        Rectangle {
                            width: 325
                            height: 260
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignTop
                            color: "transparent"
                            clip: true

                            SoundEffect {
                                id: notifIn

                                source: "../assets/fx/notify-in.wav"
                            }

                            SoundEffect {
                                id: notifOut

                                source: "../assets/fx/notify-out.wav"
                            }

                            ListView {
                                anchors.fill: parent
                                model: notifModel
                                spacing: 6
                                interactive: false

                                delegate: Rectangle {
                                    id: rootDelegate

                                    function resolveIcon(src) {
                                        if (!src)
                                            return "";

                                        if (typeof src !== "string")
                                            return "";

                                        // CASE 1: pure hex color → convert to png
                                        if (/^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$/.test(src))
                                            return "file:///tmp/" + src + ".png";

                                        // CASE 2: already a temp hex png
                                        if (src.startsWith("file:///tmp/#"))
                                            return src;

                                        // CASE 3: normal icon path / url
                                        return src;
                                    }

                                    Component.onCompleted: notifIn.play()
                                    width: 325
                                    color: "transparent"
                                    opacity: 0
                                    y: -8
                                    implicitHeight: content.implicitHeight + 14

                                    RowLayout {
                                        id: content

                                        spacing: 5

                                        Rectangle {
                                            id: notifImages

                                            width: 48
                                            height: 64
                                            color: "transparent"
                                            Layout.alignment: Qt.AlignTop

                                            Image {
                                                width: notifImages.implicitWidth
                                                height: notifImages.implicitHeight
                                                anchors.fill: parent
                                                fillMode: Image.PreserveAspectFit
                                                cache: false
                                                source: {
                                                    var icon = rootDelegate.resolveIcon(model.image);
                                                    if (icon)
                                                        return icon;

                                                    icon = rootDelegate.resolveIcon(model.appIcon);
                                                    if (icon)
                                                        return icon;

                                                    icon = rootDelegate.resolveIcon(model.icon);
                                                    if (icon)
                                                        return icon;

                                                    return "../assets/icons/notif-icon.png";
                                                }
                                            }

                                        }

                                        ColumnLayout {
                                            Layout.fillWidth: true
                                            spacing: 4

                                            Rectangle {
                                                height: 13

                                                RowLayout {
                                                    spacing: 5

                                                    Text {
                                                        text: "󰣇"
                                                        color: Colors.yellow_goldx
                                                        font.bold: true
                                                        font.pixelSize: 13
                                                        font.family: "Rajdhani"
                                                    }

                                                    Text {
                                                        id: appInfo

                                                        text: {
                                                            const app = model.appName ? model.appName.toLowerCase() : "";
                                                            if (app === "notify-send")
                                                                return "SYSTEM";

                                                            if (model.appName && model.appName.length > 0)
                                                                return model.appName.toUpperCase();

                                                            if (model.desktopEntry && model.desktopEntry.length > 0)
                                                                return model.desktopEntry.toUpperCase();

                                                            return "SYSTEM";
                                                        }
                                                        color: Colors.yellow_goldx
                                                        font.family: "Rajdhani"
                                                        font.pixelSize: 12
                                                        font.bold: true
                                                        layer.enabled: true
                                                        layer.smooth: true

                                                        layer.effect: DropShadow {
                                                            samples: 17
                                                            source: appInfo
                                                            horizontalOffset: 0
                                                            verticalOffset: 0
                                                            radius: 4
                                                            color: Colors.yellow_goldx
                                                        }

                                                    }

                                                }

                                            }

                                            Text {
                                                id: summaryText

                                                text: model.summary ? model.summary.toUpperCase() : ""
                                                color: Colors.yellow_goldx
                                                font.weight: Font.DemiBold
                                                font.pixelSize: 16
                                                font.family: "Rajdhani"
                                                wrapMode: Text.WordWrap
                                                layer.enabled: true
                                                layer.smooth: true

                                                layer.effect: DropShadow {
                                                    samples: 17
                                                    source: summaryText
                                                    horizontalOffset: 0
                                                    verticalOffset: 0
                                                    radius: 4
                                                    color: Colors.yellow_goldx
                                                }

                                            }

                                            Item {
                                                id: bodybox

                                                implicitWidth: bodyText.width + 12
                                                implicitHeight: bodyText.implicitHeight + 12
                                                clip: true
                                                layer.enabled: true
                                                layer.smooth: true

                                                NotifyBox {
                                                    anchors.fill: parent
                                                    boxWidth: bodybox.implicitWidth + 10
                                                    boxHeight: bodybox.implicitHeight + 10
                                                    bgColor: Colors.redx10
                                                    borderColor: Colors.yellow_goldx
                                                    borderWidth: 1
                                                }

                                                Text {
                                                    id: bodyText

                                                    z: 1
                                                    width: 155
                                                    text: model.body ? model.body.toUpperCase() : ""
                                                    color: Colors.yellow_goldx
                                                    font.weight: Font.Medium
                                                    topPadding: 5
                                                    font.pixelSize: 14
                                                    font.family: "Rajdhani"
                                                    wrapMode: Text.WordWrap
                                                    horizontalAlignment: Text.AlignLeft

                                                    anchors {
                                                        left: parent.left
                                                        top: parent.top
                                                        margins: 8
                                                    }

                                                    layer.effect: DropShadow {
                                                        samples: 17
                                                        source: bodyText
                                                        horizontalOffset: 0
                                                        verticalOffset: 0
                                                        radius: 6
                                                        color: Colors.yellow_goldx
                                                    }

                                                }

                                            }

                                        }

                                    }

                                    // AUTO CLOSE
                                    Timer {
                                        interval: 4000
                                        running: true
                                        onTriggered: {
                                            notifModel.remove(index);
                                            notifOut.play();
                                        }
                                    }

                                    // ANIMASI MASUK
                                    SequentialAnimation on opacity {
                                        running: true

                                        PauseAnimation {
                                            duration: Math.max(0, index) * 120
                                        }

                                        NumberAnimation {
                                            to: 1
                                            duration: 180
                                        }

                                    }

                                    SequentialAnimation on y {
                                        running: true

                                        PauseAnimation {
                                            duration: Math.max(0, index) * 120
                                        }

                                        NumberAnimation {
                                            to: 0
                                            duration: 180
                                        }

                                    }

                                }

                            }

                        }

                    }

                }

            }

        }

    }

}
