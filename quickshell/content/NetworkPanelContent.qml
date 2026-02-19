import Qt5Compat.GraphicalEffects
import QtMultimedia
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import qs.components.common
import qs.components.panel.network
import qs.components.typography
import qs.popup
import qs.services
import qs.state
import qs.styles

Rectangle {
    id: wifiPanel

    property string cachedDevice: ""
    property string cachedDriver: ""

    color: "transparent"
    implicitWidth: 670
    implicitHeight: 470
    focus: false

    SoundEffect {
        id: hoverSound

        source: "../assets/fx/hover.wav"
    }

    Connections {
        function onConnectionFailed(ssid) {
            console.log("Failed to connect:", ssid);
        }

        target: Network
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

                            width: 440
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
                                        text: "network"
                                        size: Texts.xxxs
                                        color: Colors.redx40
                                        fontWeight: "semibold"
                                        uppercase: true
                                    }

                                }

                                BorderXRed40GridLong {
                                }

                                Rectangle {
                                    height: 4
                                }

                                BorderXRed40GridLong {
                                }

                                RowLayout {
                                    spacing: 4
                                    Layout.fillWidth: true

                                    Rajdhani {
                                        text: "Network Manager"
                                        size: Texts.base
                                        color: Colors.redx40
                                        fontWeight: "bold"
                                    }

                                    FillX {
                                    }

                                    ToggleSwitch {
                                        checked: Network.wifiEnabled
                                        onToggled: {
                                            if (Network.wifiEnabled) {
                                                Network.enableWifi(true);
                                                Network.rescanWifi();
                                            } else {
                                                Network.enableWifi(false);
                                            }
                                        }
                                    }

                                }

                                BorderXRed40GridLong {
                                }

                                Rectangle {
                                    color: "transparent"
                                    width: netMain.width
                                    height: 55
                                    clip: true

                                    Column {
                                        id: ethCol

                                        width: parent.width
                                        spacing: 5
                                        anchors.fill: parent

                                        Rajdhani {
                                            text: "Ethernet"
                                            size: Texts.sm
                                            color: Colors.greyx
                                            fontWeight: "medium"
                                        }

                                        Rectangle {
                                            width: netMain.width
                                            height: 36
                                            color: "transparent"
                                            border.color: Colors.redx40

                                            RowLayout {
                                                id: netBUttonHover

                                                z: 0
                                                opacity: 1
                                                anchors.fill: parent
                                                anchors.leftMargin: 4

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
                                                    text: Network.activeEthernet ? Network.activeEthernet.interface : "No ethernet"
                                                    size: Texts.sm
                                                    color: Colors.greyx
                                                }

                                                FillX {
                                                }

                                                Rajdhani {
                                                    text: Network.activeEthernet ? "ON" : "OFF"
                                                    size: Texts.xs
                                                    color: Colors.redx
                                                }

                                                ToggleSwitch {
                                                    checked: Network.activeEthernet !== null
                                                    onToggled: function(checked) {
                                                        const d = Network.ethernetDevices[0];
                                                        if (!d)
                                                            return ;

                                                        if (checked)
                                                            Network.connectEthernet(d.connection, d.interface);
                                                        else
                                                            Network.disconnectEthernet(d.connection);
                                                    }
                                                }

                                            }

                                        }

                                    }

                                }

                                BorderXRed40GridLong {
                                }

                                Rectangle {
                                    color: "transparent"
                                    width: netMain.width
                                    height: 155
                                    clip: true

                                    Column {
                                        id: wLanCol

                                        width: parent.width
                                        spacing: 5
                                        anchors.fill: parent

                                        Rajdhani {
                                            text: "WLan"
                                            size: Texts.sm
                                            color: Colors.greyx
                                            fontWeight: "medium"
                                        }

                                        Repeater {
                                            model: Network.networks

                                            Rectangle {
                                                property bool hovered: hoverArea.containsMouse

                                                width: netMain.width
                                                height: 36
                                                color: modelData.active ? "transparent" : "transparent"
                                                border.color: Colors.redx40

                                                RowLayout {
                                                    id: netBUttonHover

                                                    z: 0
                                                    opacity: hovered ? 1 : 0
                                                    anchors.fill: parent
                                                    anchors.leftMargin: 4

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
                                                    // SSID + Security
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    anchors.fill: parent
                                                    anchors.margins: 4
                                                    spacing: 8

                                                    Rajdhani {
                                                        text: modelData.ssid
                                                        size: Texts.sm
                                                        color: hovered ? Colors.greyx : modelData.active ? Colors.greyx : Colors.redx
                                                    }

                                                    // Signal
                                                    Rajdhani {
                                                        text: modelData.strength + "%"
                                                        size: Texts.xs
                                                        color: hovered ? Colors.greyx : modelData.active ? Colors.orangex : Colors.yellow_goldx
                                                    }

                                                    Rajdhani {
                                                        text: modelData.isSecure ? "Secured" : "Open"
                                                        size: Texts.xs
                                                        color: hovered ? Colors.greyx : modelData.active ? Colors.orangex : Colors.yellow_goldx
                                                        opacity: 0.7
                                                    }

                                                    FillX {
                                                    }

                                                    Rajdhani {
                                                        text: modelData.active ? "ON" : "OFF"
                                                        size: Texts.xs
                                                        color: Colors.redx
                                                    }

                                                    ToggleSwitch {
                                                        checked: modelData.active
                                                        onToggled: function(checked) {
                                                            // 🔴 OFF → disconnect
                                                            if (!checked) {
                                                                Network.disconnectFromNetwork();
                                                                return ;
                                                            }
                                                            // 🟢 ON → connect
                                                            if (!modelData.isSecure) {
                                                                Network.connectToNetwork(modelData.ssid, "", modelData.bssid, function(_) {
                                                                });
                                                                return ;
                                                            }
                                                            // 🔒 Secure → ask password
                                                            passwordDlg.ssid = modelData.ssid;
                                                            passwordDlg.onAccept = function(password) {
                                                                Network.connectToNetwork(modelData.ssid, password, modelData.bssid, function(_) {
                                                                });
                                                            };
                                                            passwordDlg.open();
                                                        }
                                                    }

                                                }

                                                MouseArea {
                                                    id: hoverArea

                                                    hoverEnabled: true
                                                    onEntered: hoverSound.play()
                                                    anchors.fill: parent
                                                    cursorShape: Qt.PointingHandCursor
                                                }

                                            }

                                        }

                                        Popup {
                                            id: passwordDlg

                                            property string ssid: ""
                                            property var onAccept
                                            property var onCancel

                                            modal: true
                                            focus: true
                                            closePolicy: Popup.NoAutoClose
                                            width: 320
                                            height: 180
                                            anchors.centerIn: Overlay.overlay

                                            Column {
                                                anchors.fill: parent
                                                anchors.margins: 12
                                                spacing: 10

                                                Rajdhani {
                                                    text: "Connect to " + passwordDlg.ssid
                                                    color: Colors.redx
                                                    size: Texts.sm
                                                }

                                                TextField {
                                                    id: passInput

                                                    echoMode: TextInput.Password
                                                    placeholderText: "Password"
                                                    width: parent.width
                                                }

                                                Row {
                                                    spacing: 10

                                                    Button {
                                                        text: "Cancel"
                                                        onClicked: {
                                                            passwordDlg.close();
                                                            if (passwordDlg.onCancel)
                                                                passwordDlg.onCancel();

                                                        }
                                                    }

                                                    Button {
                                                        text: "Connect"
                                                        onClicked: {
                                                            passwordDlg.close();
                                                            if (passwordDlg.onAccept)
                                                                passwordDlg.onAccept(passInput.text);

                                                            passInput.text = "";
                                                        }
                                                    }

                                                }

                                            }

                                            background: Rectangle {
                                                color: Colors.darkbluex
                                                border.color: Colors.redx
                                                radius: 4
                                            }

                                        }

                                    }

                                }

                            }

                        }

                        Rectangle {
                            width: 4
                            height: 470
                            color: "transparent"
                        }

                        Rectangle {
                            width: 217
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
                                        text: "interface"
                                        size: Texts.xxxs
                                        color: Colors.redx40
                                        fontWeight: "semibold"
                                        uppercase: true
                                    }

                                    Orbitron {
                                        text: Network.active ? "wlan0" : (Network.activeEthernet ? "enp3s0" : "Cyberpunk2077")
                                        size: Texts.xxxs
                                        color: Colors.redx40
                                        fontWeight: "semibold"
                                        uppercase: true
                                    }

                                }

                                BorderXRed40Grid {
                                }

                                Rectangle {
                                    height: 4
                                }

                                BorderXRed40Grid {
                                }

                                RowLayout {
                                    spacing: 0

                                    Rajdhani {
                                        text: "network status"
                                        size: Texts.sm
                                        color: Colors.redx
                                        fontWeight: "medium"
                                        uppercase: true
                                    }

                                    FillX {
                                    }

                                    Rajdhani {
                                        text: "Interface "
                                        size: Texts.xs
                                        color: Colors.redx40
                                        fontWeight: "bold"
                                    }

                                    Rajdhani {
                                        text: Network.activeDevice && Network.activeDevice.length ? Network.activeDevice : cachedDevice
                                        size: Texts.xs
                                        color: Colors.redx40
                                        fontWeight: "bold"
                                    }

                                }

                                Rectangle {
                                    height: 40
                                    width: 217
                                    color: "transparent"

                                    RowLayout {
                                        spacing: 10

                                        Rectangle {
                                            width: 50
                                            height: 35
                                            color: "transparent"

                                            ColumnLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "state"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: (Network.active || Network.activeEthernet) ? "ONLINE" : "OFFLINE"
                                                    size: Texts.sm
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                        Rectangle {
                                            width: 100
                                            height: 35
                                            color: "transparent"

                                            ColumnLayout {
                                                spacing: 0
                                                anchors.fill: parent

                                                Rajdhani {
                                                    text: "IPv4"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                }

                                                Rajdhani {
                                                    text: Network.wirelessDeviceDetails ? Network.wirelessDeviceDetails.ipAddress : "N/A"
                                                    size: Texts.sm
                                                    width: 90
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                        Rectangle {
                                            color: "transparent"
                                            width: 50
                                            height: 35

                                            ColumnLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "Ping"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: "— ms"
                                                    size: Texts.sm
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                }

                                            }

                                        }

                                    }

                                }

                                BorderXRed40Grid {
                                }

                                Rectangle {
                                    height: 40
                                    width: 217
                                    color: "transparent"

                                    RowLayout {
                                        spacing: 5

                                        Rectangle {
                                            color: "transparent"
                                            width: 110
                                            height: 35

                                            ColumnLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "world view"
                                                    size: Texts.sm
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: "endpoint lat/lon"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                        Rectangle {
                                            color: "transparent"
                                            width: 94
                                            height: 35

                                            ColumnLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "global net map"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    uppercase: true
                                                    fontWeight: "medium"
                                                }

                                                Rajdhani {
                                                    text: GeoLocation.ready ? GeoLocation.latitude.toFixed(5) + ", " + GeoLocation.longitude.toFixed(5) : "Locating…"
                                                    //text: "48.0989.430945"
                                                    size: Texts.sm
                                                    color: Colors.redx30
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    height: 150
                                    width: 217
                                    color: "transparent"

                                    Image {
                                        width: 211
                                        height: 84
                                        anchors.fill: parent
                                        source: "../assets/images/network/worldmap.png"
                                        fillMode: Image.PreserveAspectFit
                                        opacity: 0.7
                                    }

                                    ColumnLayout {
                                        spacing: 0

                                        Rectangle {
                                            width: 217
                                            height: 17
                                            color: "transparent"
                                        }

                                    }

                                }

                                BorderXRed40Grid {
                                }

                                Rectangle {
                                    color: "transparent"
                                    height: 20
                                    width: 217

                                    RowLayout {
                                        spacing: 2

                                        Rectangle {
                                            color: "transparent"
                                            width: 100
                                            height: 20

                                            RowLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "network trafic"
                                                    size: Texts.sm
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                        Rectangle {
                                            id: upDownNet

                                            property var down: Traffic.formatSpeed(Traffic.rxRate)
                                            property var up: Traffic.formatSpeed(Traffic.txRate)

                                            color: "transparent"
                                            width: 110
                                            height: 20
                                            Layout.alignment: Qt.AlignRight

                                            RowLayout {
                                                anchors.fill: parent
                                                spacing: 2

                                                Rajdhani {
                                                    Layout.alignment: Qt.AlignRight
                                                    text: "Up"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: upDownNet.up.value
                                                    Layout.alignment: Qt.AlignRight
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: "down"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    Layout.alignment: Qt.AlignRight
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: upDownNet.down.value
                                                    Layout.alignment: Qt.AlignRight
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    height: 20
                                    width: 217
                                    color: "transparent"

                                    RowLayout {
                                        spacing: 2

                                        Rectangle {
                                            color: "transparent"
                                            width: 95
                                            height: 20

                                            RowLayout {
                                                spacing: 0

                                                Rajdhani {
                                                    text: "total"
                                                    size: Texts.sm
                                                    color: Colors.redx40
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                        Rectangle {
                                            id: netCounting

                                            readonly property var outData: Traffic.formatTotal(Traffic.totalTx)
                                            readonly property var inData: Traffic.formatTotal(Traffic.totalRx)

                                            color: "transparent"
                                            width: 120
                                            height: 20
                                            Layout.alignment: Qt.AlignRight

                                            RowLayout {
                                                spacing: 2
                                                anchors.fill: parent

                                                Rajdhani {
                                                    text: netCounting.outData.value
                                                    size: Texts.sm
                                                    Layout.alignment: Qt.AlignRight
                                                    color: Colors.redx30
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: netCounting.outData.unit
                                                    size: Texts.sm
                                                    color: Colors.redx30
                                                    Layout.alignment: Qt.AlignRight
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: "out,"
                                                    size: Texts.sm
                                                    color: Colors.redx30
                                                    Layout.alignment: Qt.AlignRight
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: netCounting.inData.value
                                                    size: Texts.sm
                                                    color: Colors.redx30
                                                    Layout.alignment: Qt.AlignRight
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: netCounting.inData.unit
                                                    size: Texts.sm
                                                    Layout.alignment: Qt.AlignRight
                                                    color: Colors.redx30
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: "in"
                                                    size: Texts.sm
                                                    color: Colors.redx30
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                    }

                                }

                                Rectangle {
                                    height: 110
                                    width: 217
                                    color: "transparent"
                                    Layout.alignment: Qt.AlignVCenter

                                    NetTrafficBg {
                                    }

                                    RowLayout {
                                        spacing: 0
                                        width: 217

                                        FillX {
                                        }

                                        Rectangle {
                                            id: netGraphx

                                            property var maxDown: Traffic.formatSpeed(Traffic.maxRx > 0 ? Traffic.maxRx : Traffic.rxRate)
                                            property var down: Traffic.formatSpeed(Traffic.rxRate)
                                            property var up: Traffic.formatSpeed(Traffic.txRate)
                                            property var maxUp: Traffic.formatSpeed(Traffic.maxTx > 0 ? Traffic.maxTx : Traffic.txRate)

                                            width: 15

                                            ColumnLayout {
                                                height: 110
                                                width: 15

                                                Rajdhani {
                                                    text: netGraphx.maxUp.value
                                                    size: Texts.xxxs
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                FillY {
                                                }

                                                Rajdhani {
                                                    text: netGraphx.up.value
                                                    size: Texts.xxxs
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                Rajdhani {
                                                    text: netGraphx.down.value
                                                    size: Texts.xxxs
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                                FillY {
                                                }

                                                Rajdhani {
                                                    text: netGraphx.maxDown.value
                                                    size: Texts.xxxs
                                                    color: Colors.redx
                                                    fontWeight: "medium"
                                                    uppercase: true
                                                }

                                            }

                                        }

                                    }

                                    NetDownEcg {
                                        id: netGraph

                                        anchors.fill: parent
                                        anchors.margins: 2
                                        upRate: Math.min(1, Traffic.txRate / (100 * 1024))
                                        downRate: Math.min(1, Traffic.rxRate / (500 * 1024))
                                        noiseAmount: 4.5
                                        snapChance: 0.35
                                        snapStrength: 0.55
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
                        radius: 10
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
