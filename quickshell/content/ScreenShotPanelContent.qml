import QtQuick
import qs.components.panel.screenshot
import qs.services

Rectangle {
    width: 300
    height: 300
    color: "transparent"

    ScreenShot {
        ScreenShotButton {
            text: "   "
            mode: "full"
            delay: 0
        }

        ScreenShotButton {
            text: "󱣴   "
            mode: "area"
            delay: 0
        }

        ScreenShotButton {
            text: "    5s"
            mode: "full"
            delay: 5
        }

        ScreenShotButton {
            text: "    10s"
            mode: "full"
            delay: 10
        }

        ScreenShotButton {
            text: "󱣴  5s"
            mode: "area"
            delay: 5
        }

        ScreenShotButton {
            text: "󱣴  10s"
            mode: "area"
            delay: 10
        }

    }

}
