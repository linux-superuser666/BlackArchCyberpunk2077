import QtQuick
import Quickshell.Io
pragma Singleton

Item {
    id: service

    property string savedPath: ""
    property bool isArea: false
    property bool isClipboard: false
    property int delaySec: 0

    function generatePath() {
        return "/home/$USER/Pictures/Screenshots/screenshot-" + Qt.formatDateTime(new Date(), "yyyyMMdd-hhmmss") + ".png";
    }

    function capture(mode, delay) {
        isArea = (mode === "area");
        isClipboard = (mode === "clip");
        delaySec = delay;
        if (!isClipboard)
            savedPath = generatePath();
        else
            savedPath = "";
        if (delaySec > 0) {
            delayTimer.interval = delaySec * 1000;
            delayTimer.start();
            notify("Screenshot", "Capturing in " + delaySec + " seconds...", "");
        } else {
            startCapture();
        }
    }

    function startCapture() {
        if (isClipboard)
            captureProc.command = ["sh", "-c", "grim -g \"$(slurp)\" - | wl-copy"];
        else if (isArea)
            captureProc.command = ["sh", "-c", "grim -g \"$(slurp)\" \"" + savedPath + "\""];
        else
            captureProc.command = ["sh", "-c", "grim \"" + savedPath + "\""];
        captureProc.running = true;
    }

    function notify(title, body, iconPath) {
        notifyProc.title = title;
        notifyProc.body = body;
        notifyProc.icon = iconPath;
        notifyProc.running = true;
    }

    Timer {
        id: delayTimer

        repeat: false
        onTriggered: startCapture()
    }

    Process {
        id: captureProc

        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0) {
                notify("Screenshot Failed", "Exit code: " + exitCode, "");
                return ;
            }
            if (isClipboard)
                notify("Screenshot", "Copied to clipboard", "");
            else
                notify("Screenshot Saved", savedPath, savedPath);
        }
    }

    Process {
        id: notifyProc

        property string title: ""
        property string body: ""
        property string icon: ""

        command: ["sh", "-c", "notify-send -a Screenshot -u low " + (icon !== "" ? "-i \"" + icon + "\" " : "") + "\"" + title + "\" \"" + body + "\""]
    }

}
