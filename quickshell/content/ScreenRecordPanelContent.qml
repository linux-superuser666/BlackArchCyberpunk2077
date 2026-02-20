import QtQuick
import qs.components.panel.screenrecord
import qs.services

Rectangle {
    width: 300
    height: 300
    color: "transparent"

    ScreenRecord {
        ScreenRecordButton {
            text: "Record Full"
            mode: "full"
            delay: 0
        }

        ScreenRecordButton {
            text: "Record Area"
            mode: "area"
            delay: 0
        }

        ScreenRecordButton {
            text: "Full (5s)"
            mode: "full"
            delay: 5
        }

        ScreenRecordButton {
            text: "Stop"
            mode: "full"
            delay: 0
        }

    }

}
