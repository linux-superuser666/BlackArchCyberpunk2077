//@ pragma Env QSG_RENDER_LOOP=threaded
//@ pragma Env QT_QUICK_FLICKABLE_WHEEL_DECELERATION=10000
//pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Services.Notifications
import Quickshell.Services.Pipewire
import Quickshell.Wayland
import qs.components.wrapper
import qs.content
import qs.panel
import qs.popup
import qs.widgets

ShellRoot {
    Variants {
        model: Quickshell.screens

        delegate: Scope {
            required property var modelData

            ScreenRecordPanel {
                screen: modelData
            }

            ScreenShotPanel {
                screen: modelData
            }

            NetworkPanel {
                screen: modelData
            }

            LauncherPanel {
                screen: modelData
            }

            NotifyPanel {
                screen: modelData
                notificationServer: notificationServer
            }

            NotificationServer {
                id: notificationServer
            }

            ScannerLeft {
                screen: modelData
            }

            ScannerRight {
                screen: modelData
            }

            BinTopRight {
                screen: modelData
            }

            RadioStation {
                screen: modelData
            }

            ChronoPanel {
                screen: modelData
            }

            SystemPanel {
                screen: modelData
            }

            ControlPanel {
                screen: modelData
            }

            WinSwitchPanel {
                screen: modelData
            }

            WLogOutPanel {
                screen: modelData
            }

            HyprPanel {
                screen: modelData
            }

            SuperUserPanel {
                screen: modelData
            }

            LevelPanel {
                screen: modelData
            }

            NetInfo {
                screen: modelData
            }

            QuickHack {
                screen: modelData
            }

            AppsFrame {
                screen: modelData
            }

            Connections {
                function onReloadCompleted() {
                    Quickshell.inhibitReloadPopup();
                }

                function onReloadFailed() {
                    Quickshell.inhibitReloadPopup();
                }

                target: Quickshell
            }

        }

    }

}
