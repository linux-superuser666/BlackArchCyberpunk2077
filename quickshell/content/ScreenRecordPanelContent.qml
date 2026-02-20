import QtQuick
import qs.components.panel.screenrecord
import qs.services

Rectangle {
    width: 300
    height: 300
    color: "transparent"

    ScreenRecord {
        ScreenRecordButton {
            text: ""
            mode: "full"
            delay: 0
        }

        ScreenRecordButton {
            text: "󱣴"
            mode: "area"
            delay: 0
        }

        ScreenRecordButton {
            text: "   5s"
            mode: "full"
            delay: 5
        }

        ScreenRecordButton {
            text: ""
            mode: "mic"
            delay: 0
        }

        ScreenRecordButton {
            text: " + "
            mode: "mixed"
            delay: 0
        }

        ScreenRecordButton {
            text: ""
            mode: "full"
            delay: 0
        }

    }

}
