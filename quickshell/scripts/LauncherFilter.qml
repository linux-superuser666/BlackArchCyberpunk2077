import QtQuick
import Quickshell
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland

QtObject {
    id: model

    property string query: ""

    property var values: {
        const apps = [...DesktopEntries.applications.values]
        const q = (model.query || "").trim().toLowerCase()

        if (q === "")
            return apps

        return apps.filter(app =>
            app.name && app.name.toLowerCase().includes(q)
        )
    }
}
