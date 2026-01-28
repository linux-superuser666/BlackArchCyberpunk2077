
import QtMultimedia
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.components.common
import qs.components.typography
import qs.scripts
import qs.state
import qs.styles

Rectangle {
    id: panelQuickHack

    property int selectedIndex: 0
    property int hoveredIndex: -1
    property int keyboardHoverIndex: -1

    function launchRoot(exec) {
        GlobalState.launch(exec);
        GlobalState.closeQuickHack();
    }

    function launchHack(exec) {
        launchRoot(exec);
    }

    function currentInfo() {
        if (!quickHackList || !quickHackList.model)
            return null;

        if (hoveredIndex !== -1)
            return quickHackList.model[hoveredIndex];

        return quickHackList.model[selectedIndex];
    }

    focus: true
    Keys.onPressed: (event) => {
        if (!GlobalState.quickHackActive)
            return ;

        switch (event.key) {
        case Qt.Key_Up:
            if (quickHackList.currentIndex > 0) {
                quickHackList.currentIndex--;
                panelQuickHack.selectedIndex = quickHackList.currentIndex;
                panelQuickHack.keyboardHoverIndex = quickHackList.currentIndex;
                quickHackList.positionViewAtIndex(quickHackList.currentIndex, ListView.Contain);
            }
            event.accepted = true;
            break;
        case Qt.Key_Down:
            if (quickHackList.currentIndex < quickHackList.count - 1) {
                quickHackList.currentIndex++;
                panelQuickHack.selectedIndex = quickHackList.currentIndex;
                panelQuickHack.keyboardHoverIndex = quickHackList.currentIndex;
                quickHackList.positionViewAtIndex(quickHackList.currentIndex, ListView.Contain);
            }
            event.accepted = true;
            break;
        case Qt.Key_Return:
        case Qt.Key_Enter:
            {
                var item = quickHackList.model[quickHackList.currentIndex];
                if (item) {
                    panelQuickHack.launchHack(item.exec);
                    GlobalState.closeQuickHack();
                }
                event.accepted = true;
                break;
            };
        }
    }
    color: "transparent"
    width: 1270
    height: 610

    QuickHackList {
        id: model
    }

    ColumnLayout {
        spacing: 0

        Rectangle {
            id: quickHackTop

            color: "transparent"
            width: 1270
            height: 100

            RowLayout {
                anchors.fill: parent
                spacing: 0

                FillX {
                }

                Rectangle {
                    id: quickHackRam

                    color: "transparent"
                    width: 200
                    height: 100

                    ColumnLayout {
                        spacing: 10

                        Rectangle {
                            color: "transparent"
                            width: 200
                            height: 100

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

                                            BinLines {
                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    color: "transparent"
                                    height: 100

                                    ColumnLayout {
                                        id: quickHackRamBox

                                        anchors.fill: parent
                                        spacing: 0

                                        Orbitron {
                                            size: 8
                                            color: Colors.redx80
                                            text: "RESOURCES V.1.001.1"
                                        }

                                        Rectangle {
                                            width: quickHackRamBox.width
                                            height: 300
                                            Layout.fillWidth: true
                                            color: "transparent"

                                            ColumnLayout {
                                                spacing: 2

                                                Rectangle {
                                                    Layout.fillWidth: true
                                                    height: 16
                                                    color: "transparent"

                                                    RowLayout {
                                                        anchors.fill: parent
                                                        spacing: 5

                                                        Rajdhani {
                                                            text: "CYBERDECK RAM:"
                                                            uppercase: true
                                                            fontWeight: "semibold"
                                                            color: Colors.redx
                                                            size: 16
                                                        }

                                                        FillX {
                                                        }

                                                        Rajdhani {
                                                            text: "16"
                                                            uppercase: true
                                                            color: Colors.greyx
                                                            size: 16
                                                        }

                                                        Rajdhani {
                                                            text: "(21)"
                                                            color: Colors.redx
                                                            uppercase: true
                                                            fontWeight: "bold"
                                                            size: 16
                                                        }

                                                    }

                                                }

                                                BorderXRed40 {
                                                    lineWidth: quickHackRamBox.width
                                                }

                                                Rajdhani {
                                                    uppercase: true
                                                    fontWeight: "semibold"
                                                    text: "blackarch"
                                                    color: Colors.redx40
                                                    Layout.fillWidth: true
                                                    size: 8
                                                }

                                                Rectangle {
                                                    id: ramBarUsingPngBig

                                                    color: "transparent"
                                                    width: 150
                                                    height: 14

                                                    RowLayout {
                                                        spacing: 2

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/swapfg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/ramfg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/ramfg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/ramfg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
                                                        }

                                                        Image {
                                                            width: 9
                                                            height: 30
                                                            source: "../assets/images/hack/rambg.png"
                                                            fillMode: Image.PreserveAspectFit
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

                FillX {
                }

            }

        }

        Rectangle {
            id: quickHackBottom

            color: "transparent"
            width: 1270
            height: 550

            RowLayout {
                spacing: 0

                Rectangle {
                    width: 35
                }

                Rectangle {
                    id: quickHackLeft

                    color: "transparent"
                    width: 260
                    height: 550

                    ColumnLayout {
                        spacing: 10
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                        Rectangle {
                            color: "transparent"
                            width: 260
                            height: 300

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

                                            BinLines {
                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignTop
                                    color: "transparent"
                                    height: 300

                                    ColumnLayout {
                                        id: quickHackRoot

                                        anchors.fill: parent
                                        spacing: 0

                                        Orbitron {
                                            size: 8
                                            text: "RESOURCES V.2304.300"
                                        }

                                        Rajdhani {
                                            text: "AVALIABLE QUICKHACks:"
                                            color: Colors.redx
                                            fontWeight: "semibold"
                                            size: 16
                                            uppercase: true
                                        }

                                        BorderXRed40 {
                                            lineWidth: 260
                                        }

                                        Rajdhani {
                                            text: "blackarch"
                                            color: Colors.redx40
                                            fontWeight: "semibold"
                                            size: 8
                                            uppercase: true
                                        }

                                        Rectangle {
                                            height: 10
                                        }

                                        Rectangle {
                                            width: 263
                                            height: 340
                                            Layout.alignment: Qt.AlignTop
                                            color: "transparent"

                                            ColumnLayout {
                                                spacing: 1

                                                ListView {
                                                    id: quickHackList

                                                    Component.onCompleted: {
                                                        quickHackList.currentIndex = 1;
                                                        panelQuickHack.selectedIndex = 1;
                                                    }
                                                    onCurrentIndexChanged: {
                                                        panelQuickHack.selectedIndex = currentIndex;
                                                    }
                                                    width: 260
                                                    height: 330
                                                    spacing: 5
                                                    model: model.values

                                                    delegate: Rectangle {
                                                        id: delegateRoot

                                                        property bool keyboardHovered: panelQuickHack.keyboardHoverIndex === index
                                                        property bool hovered: false

                                                        onKeyboardHoveredChanged: {
                                                            if (keyboardHovered) {
                                                                hoverOnceAnim.stop();
                                                                hoverImg.x = -30;
                                                                hoverImg.opacity = 0;
                                                                hoverOnceAnim.start();
                                                            }
                                                        }
                                                        width: 263
                                                        height: 36
                                                        color: "transparent"
                                                        states: [
                                                            State {
                                                                name: "idle"
                                                                when: (delegateRoot.hovered || delegateRoot.keyboardHovered) && !ListView.isCurrentItem
                                                            },
                                                            State {
                                                                name: "hover"
                                                                when: (delegateRoot.hovered || delegateRoot.keyboardHovered) && !ListView.isCurrentItem

                                                                PropertyChanges {
                                                                    target: hoverImg
                                                                    x: 90
                                                                    opacity: 0.3
                                                                }

                                                            },
                                                            State {
                                                                name: "active"
                                                                when: ListView.isCurrentItem
                                                            }
                                                        ]
                                                        transitions: [
                                                            Transition {
                                                                from: "idle"
                                                                to: "hover"

                                                                ParallelAnimation {
                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "x"
                                                                        duration: 160
                                                                        easing.type: Easing.OutCubic
                                                                    }

                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "opacity"
                                                                        duration: 120
                                                                    }

                                                                }

                                                            },
                                                            Transition {
                                                                from: "hover"
                                                                to: "idle"

                                                                ParallelAnimation {
                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "x"
                                                                        duration: 140
                                                                        easing.type: Easing.InCubic
                                                                    }

                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "opacity"
                                                                        duration: 100
                                                                    }

                                                                }

                                                            }
                                                        ]

                                                        SequentialAnimation {
                                                            id: hoverOnceAnim

                                                            running: false

                                                            ParallelAnimation {
                                                                NumberAnimation {
                                                                    target: hoverImg
                                                                    property: "x"
                                                                    from: -30
                                                                    to: 100
                                                                    duration: 280
                                                                    easing.type: Easing.OutCubic
                                                                }

                                                                SequentialAnimation {
                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "opacity"
                                                                        from: 0
                                                                        to: 0.7
                                                                        duration: 180
                                                                    }

                                                                    NumberAnimation {
                                                                        target: hoverImg
                                                                        property: "opacity"
                                                                        from: 0.8
                                                                        to: 0
                                                                        duration: 180
                                                                    }

                                                                }

                                                            }

                                                        }

                                                        MouseArea {
                                                            anchors.fill: parent
                                                            hoverEnabled: true
                                                            cursorShape: Qt.PointingHandCursor
                                                            onEntered: {
                                                                delegateRoot.hovered = true;
                                                                panelQuickHack.keyboardHoverIndex = -1;
                                                                hoverOnceAnim.stop();
                                                                hoverImg.x = -30;
                                                                panelQuickHack.hoveredIndex = index;
                                                                hoverImg.opacity = 0;
                                                                hoverOnceAnim.start();
                                                            }
                                                            onExited: {
                                                                delegateRoot.hovered = false;
                                                                panelQuickHack.hoveredIndex = -1;
                                                                hoverOnceAnim.stop();
                                                                hoverImg.x = -30;
                                                                hoverImg.opacity = 0;
                                                            }
                                                            onClicked: {
                                                                ListView.view.currentIndex = index;
                                                                panelQuickHack.selectedIndex = index;
                                                                panelQuickHack.launchRoot(model.exec);
                                                            }
                                                        }

                                                        Image {
                                                            id: bgImage

                                                            width: 263
                                                            height: 40
                                                            anchors.verticalCenter: parent.verticalCenter
                                                            fillMode: Image.PreserveAspectFit
                                                            source: delegateRoot.state === "active" ? "../assets/images/hack/qhackactive.png" : (delegateRoot.hovered || delegateRoot.keyboardHovered) ? "../assets/images/hack/qhackselect.png" : "../assets/images/hack/qhackidle.png"


                                                        }

                                                        Image {
                                                            id: hoverImg

                                                            width: 119
                                                            height: 40
                                                            fillMode: Image.PreserveAspectFit
                                                            source: "../assets/images/hack/hover.png"
                                                            y: -2
                                                            x: -30
                                                            opacity: 0


                                                        }

                                                        RowLayout {
                                                            anchors.fill: parent
                                                            spacing: 8

                                                            Item {
                                                                width: 5
                                                            }

                                                            Rectangle {
                                                                Layout.fillWidth: true
                                                                height: 40
                                                                color: "transparent"

                                                                ColumnLayout {
                                                                    spacing: 1

                                                                    Rectangle {
                                                                        width: 180
                                                                        height: 17
                                                                        color: "transparent"
                                                                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft

                                                                        Text {
                                                                            id: modelName

                                                                            topPadding: 2
                                                                            text: modelData.name
                                                                            color: Colors.greyx
                                                                            font.capitalization: Font.AllUppercase
                                                                            Layout.fillWidth: true
                                                                            font.weight: Font.DemiBold
                                                                            font.pixelSize: 14
                                                                            font.family: "Rajdhani"
                                                                        }

                                                                    }

                                                                    Rectangle {
                                                                        width: 30
                                                                        height: 14
                                                                        color: "transparent"
                                                                        border.color: Colors.cyanx
                                                                        border.width: 1
                                                                        radius: 2

                                                                        Text {
                                                                            id: modelStatus

                                                                            anchors.centerIn: parent
                                                                            topPadding: 1
                                                                            color: Colors.greyx
                                                                            font.capitalization: Font.AllUppercase
                                                                            font.bold: true
                                                                            font.pixelSize: 8
                                                                            font.family: "Rajdhani"
                                                                            text: delegateRoot.state === "active" ? "ACTIVE" : delegateRoot.state === "hover" ? "SELECT" : "READY"
                                                                        }

                                                                    }

                                                                }

                                                            }

                                                            Rectangle {
                                                                width: 32 + 7
                                                                height: 30
                                                                color: "transparent"

                                                                Image {
                                                                    id: hackIcon

                                                                    anchors.centerIn: parent
                                                                    width: 32
                                                                    height: 30
                                                                    source: "../assets/icons/hack/john-icon.png"


                                                                }

                                                            }

                                                        }

                                                    }

                                                }

                                                BorderXRed40 {
                                                    lineWidth: quickHackList.implicitWidth
                                                }

                                                RowLayout {
                                                    spacing: 10

                                                    SysImgText {
                                                    }

                                                    Item {
                                                        Layout.fillWidth: true
                                                    }

                                                    Rectangle {
                                                        width: qhackStop.implicitWidth
                                                        height: qhackStop.implicitHeight
                                                        color: "transparent"

                                                        PanelActionOutLabel {
                                                            id: qhackStop

                                                            keyText: "󰌑"
                                                            labelText: "LAUNCH"
                                                        }

                                                    }

                                                    Rectangle {
                                                        width: qhackExit.implicitWidth
                                                        height: qhackExit.implicitHeight
                                                        color: "transparent"

                                                        PanelActionOutLabel {
                                                            id: qhackExit

                                                            keyText: "C"
                                                            labelText: "CLose"
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

                Rectangle {
                    id: quickHackSpacer

                    color: "transparent"
                    width: 675
                    height: 550
                }

                Rectangle {
                    id: quickHackRight

                    color: "transparent"
                    width: 300
                    implicitHeight: contentColumn.implicitHeight
                    Layout.alignment: Qt.AlignTop

                    ColumnLayout {
                        id: contentColumn

                        anchors.fill: parent
                        spacing: 10

                        Rectangle {
                            color: "transparent"
                            width: 280 + 5
                            implicitHeight: quickHackInfo.implicitHeight

                            RowLayout {
                                width: parent.width
                                spacing: 15

                                Rectangle {
                                    width: 255
                                    color: "transparent"

                                    ColumnLayout {
                                        id: quickHackInfo

                                        Layout.alignment: Qt.AlignTop
                                        spacing: 6
                                        Layout.fillWidth: true

                                        Orbitron {
                                            text: "HACK INFO"
                                            size: 8
                                            Layout.alignment: Qt.AlignRight
                                        }

                                        // ===== HEADER =====
                                        ColumnLayout {
                                            spacing: 2

                                            Rajdhani {
                                                text: "thug:"
                                                color: Colors.redx
                                                fontWeight: "semibold"
                                                size: 16
                                                uppercase: true
                                            }

                                            BorderXRed40 {
                                                lineWidth: 250
                                            }

                                            Rajdhani {
                                                text: "blackarch"
                                                color: Colors.redx40
                                                fontWeight: "semibold"
                                                size: 8
                                                uppercase: true
                                            }

                                        }

                                        // ===== TARGET SCAN =====
                                        Rectangle {
                                            id: targetScan

                                            implicitWidth: 265
                                            implicitHeight: targetScanContent.implicitHeight + 10
                                            color: Colors.darkbluex40

                                            ColumnLayout {
                                                id: targetScanContent

                                                z: 1
                                                spacing: 6
                                                Layout.fillWidth: true

                                                Text {
                                                    text: "TARGET SCAN"
                                                    leftPadding: 3
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 16
                                                    font.capitalization: Font.AllUppercase
                                                    font.bold: true
                                                    color: Colors.greyx
                                                }

                                                BorderXRed40 {
                                                    lineWidth: targetScanContent.width
                                                }

                                                Text {
                                                    leftPadding: 3
                                                    text: "ABOUT"
                                                    font.family: "Orbitron"
                                                    font.pixelSize: 8
                                                    font.capitalization: Font.AllUppercase
                                                    font.bold: true
                                                    color: Colors.redx40
                                                }

                                                BorderXRed40 {
                                                    lineWidth: targetScanContent.width
                                                }

                                                Text {
                                                    Layout.preferredWidth: 255
                                                    Layout.fillWidth: false
                                                    wrapMode: Text.Wrap
                                                    leftPadding: 3
                                                    text: panelQuickHack.currentInfo()?.comment || "N/A"
                                                    font.family: "Rajdhani"
                                                    font.capitalization: Font.AllUppercase
                                                    font.pixelSize: 12
                                                    font.weight: Font.DemiBold
                                                    color: Colors.greyx
                                                }

                                                Text {
                                                    text: "TYPE"
                                                    leftPadding: 3
                                                    font.family: "Orbitron"
                                                    font.pixelSize: 8
                                                    font.capitalization: Font.AllUppercase
                                                    font.bold: true
                                                    color: Colors.redx40
                                                }

                                                BorderXRed40 {
                                                    lineWidth: targetScanContent.width
                                                }

                                                Text {
                                                    Layout.preferredWidth: 255
                                                    leftPadding: 3
                                                    Layout.fillWidth: false
                                                    wrapMode: Text.Wrap
                                                    text: panelQuickHack.currentInfo()?.categories?.split(";")[0] || "N/A"
                                                    font.family: "Rajdhani"
                                                    font.capitalization: Font.AllUppercase
                                                    font.pixelSize: 14
                                                    font.weight: Font.DemiBold
                                                    color: Colors.greyx
                                                }

                                                Text {
                                                    leftPadding: 3
                                                    text: "CATEGORIES"
                                                    font.family: "Orbitron"
                                                    font.capitalization: Font.AllUppercase
                                                    font.pixelSize: 8
                                                    font.bold: true
                                                    color: Colors.redx40
                                                }

                                                BorderXRed40 {
                                                    lineWidth: targetScanContent.width
                                                }

                                                Text {
                                                    Layout.preferredWidth: 255
                                                    Layout.fillWidth: false
                                                    leftPadding: 3
                                                    font.capitalization: Font.AllUppercase
                                                    wrapMode: Text.Wrap
                                                    text: panelQuickHack.currentInfo()?.categories || "N/A"
                                                    font.family: "Rajdhani"
                                                    font.pixelSize: 14
                                                    font.weight: Font.DemiBold
                                                    color: Colors.greyx
                                                }

                                            }



                                        }

                                        BorderXRed40 {
                                            lineWidth: targetScan.width
                                        }

                                        SysImgText {
                                        }

                                    }

                                }

                                Rectangle {
                                    width: 24
                                    height: 10
                                    color: "transparent"

                                    BinLines {
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
