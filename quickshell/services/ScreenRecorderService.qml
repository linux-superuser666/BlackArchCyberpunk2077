import QtQuick
import Quickshell.Io
pragma Singleton

Item {
    id: service

    property bool recording: false
    property bool isArea: false
    property bool withMic: false
    property bool withDesktop: false
    property int delaySec: 0
    property string savedPath: ""

    function generatePath() {
        return "/home/$USER/Videos/recording-" + Qt.formatDateTime(new Date(), "yyyyMMdd-hhmmss") + ".mp4";
    }

    function start(mode, delay) {
        if (recording)
            return ;

        isArea = (mode === "area");
        withMic = (mode === "mic" || mode === "mixed");
        withDesktop = (mode === "mixed");
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
        let audioArg = "";
        if (withMic && withDesktop)
            audioArg = "--audio"; // PipeWire auto mix
        else if (withMic)
            audioArg = "--audio";
        else
            audioArg = "";
        if (isArea)
            recordProc.command = ["sh", "-c", "wf-recorder " + audioArg + " -g \"$(slurp)\" -f \"" + savedPath + "\""];
        else
            recordProc.command = ["sh", "-c", "wf-recorder " + audioArg + " -f \"" + savedPath + "\""];
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

    Process {
        id: recordProc

        onExited: (exitCode, exitStatus) => {
            recording = false;
            if (exitCode === 0)
                notify("Recording Saved", savedPath, "");
            else
                notify("Recording Stopped", "Exit code: " + exitCode, "");
        }
    }

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
