import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
pragma Singleton

QtObject {
    id: globalState

    property bool levelPanelActive: false
    property bool systemPanelActive: false
    property bool panelNotifyActive: false
    property bool launcherActive: false
    property bool networkActive: false
    property bool quickHackActive: false
    property bool radioStationActive: false
    property bool superUserActive: false
    property bool winSwitchActive: false
    property bool netPopupVisible: false
    property bool wLogOutActive: false

    function toggleWLogOut() {
        GlobalState.wLogOutActive = !GlobalState.wLogOutActive;
    }

    function closeWLogOut() {
        wLogOutActive = false;
    }

    function showNetPopup() {
        netPopupVisible = true;
    }

    function hideNetPopup() {
        netPopupVisible = false;
    }

    function toggleNetPopUp() {
        netPopupVisible = !netPopupVisible;
    }

    function toggleWinSwitch() {
        GlobalState.winSwitchActive = !GlobalState.winSwitchActive;
    }

    function closeWinSwitch() {
        winSwitchActive = false;
    }

    function toggleSuperUser() {
        GlobalState.superUserActive = !GlobalState.superUserActive;
    }

    function closeSuperUser() {
        superUserActive = false;
    }

    function toggleRadioStation() {
        GlobalState.radioStationActive = !GlobalState.radioStationActive;
    }

    function closeRadioStation() {
        radioStationActive = false;
    }

    function toggleQuickHack() {
        GlobalState.quickHackActive = !GlobalState.quickHackActive;
    }

    function closeQuickHack() {
        quickHackActive = false;
    }

    function toggleLauncher() {
        GlobalState.launcherActive = !GlobalState.launcherActive;
    }

    function closeLauncher() {
        launcherActive = false;
    }

    function toggleNetwork() {
        networkActive = !networkActive;
    }

    function closeNetwork() {
        networkActive = false;
    }

    function toggleSystem() {
        systemPanelActive = !systemPanelActive;
    }

    function closeSystem() {
        systemPanelActive = false;
    }

    function toggleLevel() {
        levelPanelActive = !levelPanelActive;
    }

    function closeLevel() {
        levelPanelActive = false;
    }

    function showAll() {
        panelNotifyActive = true;
    }

    function hideAll() {
        panelNotifyActive = false;
    }

    function showPanelNotify() {
        panelNotifyActive = true;
    }

    function hidePanelNotify() {
        panelNotifyActive = false;
    }

}
