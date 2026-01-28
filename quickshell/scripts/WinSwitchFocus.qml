import QtQuick
import Quickshell.Io

Item {
    id: helper
    visible: false

    function focusWindow(win) {
        if (!win || !win.address || !win.workspace?.id)
            return;

        const cmd =
            "hyprctl --batch " +
            "'dispatch workspace " + win.workspace.id +
            "; dispatch focuswindow address:" + win.address + "'";

        console.log("EXEC:", cmd);

        proc.command = ["sh", "-c", cmd];
        proc.running = true;
    }

    Process {
        id: proc
    }
}
