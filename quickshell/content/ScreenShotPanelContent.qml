import QtQuick
import qs.components.panel.screenshot
import qs.services

Rectangle {
    width: 300
    height: 300
    color: "transparent"

    ScreenShot {
        ScreenShotButton {
            text: "Full"
            mode: "full"
            delay: 0
        }

        ScreenShotButton {
            text: "Area"
            mode: "area"
            delay: 0
        }

        ScreenShotButton {
            text: "Full 5s"
            mode: "full"
            delay: 5
        }

        ScreenShotButton {
            text: "Full 10s"
            mode: "full"
            delay: 10
        }

        ScreenShotButton {
            text: "Area 5s"
            mode: "area"
            delay: 5
        }

        ScreenShotButton {
            text: "Area 10s"
            mode: "area"
            delay: 10
        }

    }

}
