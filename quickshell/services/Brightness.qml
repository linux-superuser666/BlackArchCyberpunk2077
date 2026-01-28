import QtQuick
import Quickshell.Io

Item {
    id: root

    property int brightness: 0
    property int maxValue: 1

    function updateBrightness(percent) {
        if (maxValue <= 0)
            return ;

        percent = Math.max(0, Math.min(100, percent));
        root.brightness = percent;
        const val = Math.round((percent / 100) * maxValue);
        setBrightness.command = ["brightnessctl", "s", val.toString()];
        setBrightness.running = true;
    }

    Component.onCompleted: {
        brightMax.running = true;
    }

    Process {
        id: brightMax

        command: ["brightnessctl", "m"]

        stdout: SplitParser {
            onRead: (data) => {
                const v = parseInt(data.trim());
                if (v > 0) {
                    root.maxValue = v;
                    // 🔥 SET DEFAULT BRIGHTNESS = 100%
                    root.updateBrightness(100);
                    brightProc.running = true;
                }
            }
        }

    }

    Process {
        id: brightProc

        command: ["brightnessctl", "g"]

        stdout: SplitParser {
            onRead: (data) => {
                const cur = parseInt(data.trim());
                if (cur > 0 && root.maxValue > 0)
                    root.brightness = Math.round((cur / root.maxValue) * 100);

            }
        }

    }

    Process {
        id: setBrightness
    }

    Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: brightProc.running = true
    }

}
