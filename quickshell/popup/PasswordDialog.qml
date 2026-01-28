import QtQuick
import QtQuick.Controls

Popup {
    id: dlg

    property string ssid: ""
    property var onAccept
    property var onCancel

    modal: true
    focus: true

    Button {
        text: "Connect"
        onClicked: {
            dlg.close();
            dlg.onAccept(pass.text);
            pass.text = "";
        }
    }

    Button {
        text: "Cancel"
        onClicked: {
            dlg.close();
            dlg.onCancel();
        }
    }

}
