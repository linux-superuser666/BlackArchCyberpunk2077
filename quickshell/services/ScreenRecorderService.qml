import QtQuick
import Quickshell.Io
pragma Singleton

Item {
    id: service

    property bool recording: false
    property bool isArea: false
    property int delaySec: 0
    property string savedPath: ""
    property int recorderPid: -1

    function generatePath() {
        return "/home/$USER/Videos/recording-" + Qt.formatDateTime(new Date(), "yyyyMMdd-hhmmss") + ".mp4";
    }

    function start(mode, delay) {
        if (recording)
            return ;

        isArea = (mode === "area");
        delaySec = delay;
        savedPath = generatePath();
        if (delaySec > 0) {
            delayTimer.interval = delaySec * 1000;
            delayTimer.start();
            notify("Screen Recorder", "Recording in " + delaySec + " seconds...", "");
        } else {
            startRecording();
        }
    }

    function startRecording() {
        if (isArea)
            recordProc.command = ["sh", "-c", "wf-recorder -g \"$(slurp)\" -f \"" + savedPath + "\""];
        else
            recordProc.command = ["sh", "-c", "wf-recorder -f \"" + savedPath + "\""];
        recordProc.running = true;
        recording = true;
        notify("Screen Recorder", "Recording started", "");
    }

    function stop() {
        if (!recording)
            return ;

        stopProc.running = true;
    }

    function toggle(mode, delay) {
        if (recording)
            stop();
        else
            start(mode, delay);
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
        onTriggered: startRecording()
    }

    // recorder process
    Process {
        id: recordProc

        onStarted: {
            recording = true;
        }
        onExited: (exitCode, exitStatus) => {
            recording = false;
            if (exitCode === 0)
                notify("Recording Saved", savedPath, "");
            else
                notify("Recording Stopped", "Exit code: " + exitCode, "");
        }
    }

    // stop via pkill
    Process {
        id: stopProc

        command: ["pkill", "-INT", "wf-recorder"]
        onStarted: {
            recording = false;
            notify("Screen Recorder", "Stopping...", "");
        }
    }

    Process {
        id: notifyProc

        property string title: ""
        property string body: ""
        property string icon: ""

        command: ["sh", "-c", "notify-send -a ScreenRecorder -u low " + (icon !== "" ? "-i \"" + icon + "\" " : "") + "\"" + title + "\" \"" + body + "\""]
    }

}
