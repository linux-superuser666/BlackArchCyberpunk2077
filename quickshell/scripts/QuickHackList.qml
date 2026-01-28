import QtQuick
import Quickshell

QtObject {
    id: root

    property string query: ""

    property var allowedApps: [
        "nmap",
        "wireshark",
        "putty",
        "john",
        "metasploit"
    ]

    property var values: {
        const apps = [...DesktopEntries.applications.values]
        const q = (query || "").trim().toLowerCase()

        return apps.filter(app => {
            if (!app.name)
                return false

            const name = app.name.toLowerCase()

            // whitelist
            if (!allowedApps.some(a => name.includes(a)))
                return false

            // optional search
            if (q !== "" && !name.includes(q))
                return false

            return true
        })
    }
}
