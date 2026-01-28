import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import qs.components.common
import qs.components.panel.radio
import qs.components.typography
import qs.content
import qs.services
import qs.state
import qs.styles

Rectangle {
    id: radioStationContent

    property bool keyboardMode: false
    property int currentIndex: 0

    function moveUp() {
        currentIndex = Math.max(0, currentIndex - 1);
        playlistView.currentIndex = currentIndex;
        playlistView.positionViewAtIndex(currentIndex, ListView.Contain);
    }

    function moveDown() {
        currentIndex = Math.min(playlist.model.count - 1, currentIndex + 1);
        playlistView.currentIndex = currentIndex;
        playlistView.positionViewAtIndex(currentIndex, ListView.Contain);
    }

    function playCurrent() {
        if (playlist.model.count === 0)
            return ;

        playlist.play(playlist.model.get(currentIndex).position);
    }

    focus: true
    Keys.onPressed: (event) => {
        if (!GlobalState.radioStationActive)
            return ;

        keyboardMode = true;
        switch (event.key) {
        case Qt.Key_Plus:
        case Qt.Key_Equal:
            volume.up();
            event.accepted = true;
            break;
        case Qt.Key_Minus:
            volume.down();
            event.accepted = true;
            break;
        case Qt.Key_F:
            playlist.stop();
            event.accepted = true;
            break;
        case Qt.Key_Up:
            radioStationContent.moveUp();
            event.accepted = true;
            break;
        case Qt.Key_Down:
            radioStationContent.moveDown();
            event.accepted = true;
            break;
        case Qt.Key_Return:
        case Qt.Key_Enter:
            radioStationContent.playCurrent();
            event.accepted = true;
            break;
        }
    }
    visible: true
    color: "transparent"
    implicitWidth: 400
    implicitHeight: 520

    Volume {
        id: volume
    }

    Playlist {
        id: playlist
    }

    // ------ User Interfaces
    ColumnLayout {
        anchors.fill: parent
        spacing: 1
        Layout.fillWidth: true

        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 8
            spacing: 0

            Rajdhani {
                size: 8
                text: "TRN_TCLAS_800095"
            }

            FillX {
            }

            Rajdhani {
                size: 8
                text: "RADIOSTATION DATABASE"
            }

        }

        RowLayout {
            spacing: 2
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 32

            RadioHeadBracket {
            }

            Rectangle {
                Layout.fillWidth: true
                height: 32
                color: "transparent"
                Layout.alignment: Qt.AlignCenter

                RadioHeadPlate {
                    boxWidth: parent.width
                    boxHeight: parent.height
                    bgColor: Colors.darkbluex70
                    borderColor: Colors.redx40
                    borderWidth: 1
                }

                Text {
                    Layout.alignment: Qt.AlignCenter
                    font.pixelSize: 16
                    anchors.left: parent.left
                    font.family: "Rajdhani"
                    font.bold: true
                    color: Colors.greyx
                    text: "RADIOSTATION"

                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 5
                    }

                }

            }

        }

        RowLayout {
            spacing: 0
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 8

            Rectangle {
                width: 170
                color: "transparent"
                height: 8
            }

            Rajdhani {
                size: Texts.xxs
                color: Colors.redx40
                fontWeight: "bold"
                text: "NOW PLAYING"
            }

        }

        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 155
            spacing: 3

            Rectangle {
                color: "transparent"
                height: 155
                width: 163

                RowLayout {
                    spacing: 1

                    RadioCoverBracket {
                    }

                    Rectangle {
                        height: 152
                        width: 152
                        color: "transparent"

                        Image {
                            width: 152
                            height: 152
                            source: "../assets/images/radio/cover-bg.png"
                            fillMode: Image.PreserveAspectFit
                        }

                        Image {
                            id: cover

                            anchors.centerIn: parent
                            width: 130
                            height: 130
                            source: "/tmp/.music_cover.jpg"
                            fillMode: Image.PreserveAspectFit
                        }

                        Image {
                            width: 145
                            height: 145
                            source: "../assets/images/radio/cover-fg.png"
                            fillMode: Image.PreserveAspectFit
                        }

                        ColumnLayout {
                            spacing: 0

                            Item {
                                height: 120
                            }

                            SysImgText {
                            }

                        }

                    }

                }

            }

            Rectangle {
                height: 152
                Layout.fillWidth: true
                color: "transparent"

                ColumnLayout {
                    spacing: 1

                    BorderXRed40 {
                        lineWidth: 220
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 130
                        color: "transparent"

                        ColumnLayout {
                            spacing: 5

                            Text {
                                font.pixelSize: 16
                                font.family: "Rajdhani"
                                font.bold: true
                                color: Colors.redx
                                text: playlist.songTitle.toUpperCase()
                            }

                            Text {
                                font.pixelSize: 14
                                font.family: "Rajdhani"
                                font.bold: true
                                color: Colors.redx
                                text: playlist.songArtist.toUpperCase()
                            }

                        }

                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 20
                        color: "transparent"

                        RowLayout {
                            spacing: 1

                            Rectangle {
                                width: volText.implicitWidth
                                height: 20
                                color: "transparent"

                                Text {
                                    id: volText

                                    font.pixelSize: 14
                                    font.family: "Rajdhani"
                                    font.bold: true
                                    color: Colors.redx
                                    text: "VOLUME"
                                }

                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 20
                                color: "transparent"

                                RowLayout {
                                    spacing: 5

                                    Item {
                                        width: 80
                                    }

                                    Rectangle {
                                        width: 15
                                        height: 20
                                        color: "transparent"

                                        Text {
                                            font.pixelSize: 14
                                            font.family: "Rajdhani"
                                            color: Colors.greyx
                                            text: ""
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: volume.down()
                                        }

                                    }

                                    Rectangle {
                                        width: 35
                                        height: 20
                                        color: "transparent"

                                        Text {
                                            id: volDigi

                                            anchors.centerIn: parent
                                            font.pixelSize: 16
                                            font.family: "Rajdhani"
                                            font.weight: Font.DemiBold
                                            color: Colors.greyx
                                            text: volume.level + "%"
                                        }

                                    }

                                    Rectangle {
                                        width: 15
                                        height: 20
                                        color: "transparent"

                                        Text {
                                            font.pixelSize: 14
                                            font.family: "Rajdhani"
                                            color: Colors.greyx
                                            text: ""
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: volume.up()
                                        }

                                    }

                                }

                            }

                        }

                    }

                    BorderXRed40 {
                        lineWidth: 220
                    }

                }

            }

        }

        RowLayout {
            spacing: 5
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 270

            Rectangle {
                width: 5
            }

            Rectangle {
                // ------- PLAYLIST
                Layout.fillWidth: true
                Layout.preferredHeight: 270
                color: "transparent"

                ListView {
                    id: playlistView

                    leftMargin: 2
                    rightMargin: 10
                    topMargin: 5
                    bottomMargin: 5
                    clip: true
                    anchors.fill: parent
                    model: playlist.model
                    currentIndex: radioStationContent.currentIndex

                    delegate: Rectangle {
                        property bool hovered: false
                        property bool isPlaying: position === playlist.currentPos
                        property bool isSelected: index === radioStationContent.currentIndex
                        property bool highlighted: isPlaying || isSelected || (!radioStationContent.keyboardMode && hovered)

                        width: ListView.view.width
                        height: 28
                        color: "transparent"

                        RadioButton {
                            id: buttonRadio

                            btnWidth: parent.width - 3
                            btnHeight: parent.height
                            btnBg: Colors.greyx30
                            btnBorderColor: Colors.greyx
                            btnBorderWidth: 1
                            visible: highlighted
                            opacity: hovered ? 1 : 0.85
                        }

                        RowLayout {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 5

                            Rectangle {
                                width: 1
                            }

                            Rectangle {
                                id: idleSongIcon

                                visible: !highlighted
                                opacity: hovered ? 1 : 0.75
                                height: 26
                                color: "transparent"
                                width: 10

                                ColumnLayout {
                                    spacing: -2

                                    Text {
                                        text: "101010111"
                                        font.family: "Rajdhani"
                                        font.weight: Font.DemiBold
                                        font.pixelSize: 3
                                        color: "transparent"
                                    }

                                    Text {
                                        text: "  101010111"
                                        font.family: "Rajdhani"
                                        font.weight: Font.DemiBold
                                        font.pixelSize: 4
                                        color: "white"
                                    }

                                    Text {
                                        text: "  10010111001"
                                        font.family: "Rajdhani"
                                        font.weight: Font.DemiBold
                                        font.pixelSize: 3
                                        color: "white"
                                    }

                                    Text {
                                        text: "  5641456"
                                        font.family: "Rajdhani"
                                        font.weight: Font.DemiBold
                                        font.pixelSize: 4
                                        color: "white"
                                    }

                                    Text {
                                        text: "  10010111001"
                                        font.family: "Rajdhani"
                                        font.weight: Font.DemiBold
                                        font.pixelSize: 3
                                        color: "white"
                                    }

                                }

                            }

                            HoverSongIcon {
                                visible: highlighted
                                opacity: hovered ? 1 : 0.75
                            }

                            Rectangle {
                                width: 5
                            }

                            Text {
                                text: title.toUpperCase()
                                Layout.fillWidth: true
                                font.family: "Rajdhani"
                                font.weight: Font.DemiBold
                                font.pixelSize: 14
                                color: "white"
                                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                            }

                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onEntered: {
                                radioStationContent.keyboardMode = false;
                                hovered = true;
                                radioStationContent.currentIndex = index;
                            }
                            onExited: hovered = false
                            onClicked: {
                                playlist.play(position);
                            }
                        }

                    }

                }

            }

            Rectangle {
                id: scrollbar

                width: 3
                height: playlistView.height
                color: Colors.blackx
                radius: 2
                visible: playlistView.contentHeight > playlistView.height

                Rectangle {
                    id: thumb

                    width: parent.width
                    radius: 2
                    color: Colors.redx
                    height: Math.max(parent.height * playlistView.visibleArea.heightRatio, 20)
                    y: parent.height * playlistView.visibleArea.yPosition
                }

            }

        }

        BorderXRed40 {
            lineWidth: radioStationContent.implicitWidth
        }

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 20

            SysImgText {
            }

            FillX {
            }

            Rectangle {
                width: radioStop.implicitWidth
                height: radioStop.implicitHeight
                color: "transparent"

                PanelActionOutLabel {
                    id: radioStop

                    keyText: "F"
                    labelText: "stop"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        stopProc.running = true;
                    }
                }

            }

            Rectangle {
                width: radioExit.implicitWidth
                height: radioExit.implicitHeight
                color: "transparent"

                PanelActionOutLabel {
                    id: radioExit

                    keyText: "C"
                    labelText: "CLose"
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        playlist.stop();
                    }
                }

            }

        }

    }

}
