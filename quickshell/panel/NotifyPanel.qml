import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import qs.components.wrapper
import qs.content
import qs.state
import qs.styles as Styles

PanelWindow {
    id: notifyPanel

    required property NotificationServer notificationServer
    required property var screen
    property bool anyPanelActive: GlobalState.panelNotifyActive

    screen: screen
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: anyPanelActive ? Math.min(notifyContentColumn.implicitWidth, 3300) : 0
    implicitHeight: 270

    anchors {
        left: true
        bottom: true
    }

    ListModel {
        id: notifModel

        onCountChanged: {
            if (count > 0)
                GlobalState.showPanelNotify();
            else
                GlobalState.hidePanelNotify();
        }
    }

    Connections {
        function onNotification(notification) {
            notifModel.insert(0, {
                "summary": notification.summary,
                "body": notification.body,
                "image": notification.image ?? "",
                "appIcon": notification.appIcon ?? "",
                "icon": notification.icon ?? "",
                "appName": notification.appName ?? "System",
                "desktopEntry": notification.desktopEntry ?? ""
            });
            GlobalState.showPanelNotify();
        }

        target: notificationServer
    }

    ColumnLayout {
        id: notifyContentColumn

        anchors.leftMargin: 20
        spacing: 0
        anchors.left: parent.left

        NotifyWrapper {
            active: GlobalState.panelNotifyActive
            panelWidth: 325
            panelHeight: 190

            NotifyPanelContent {
            }

        }

        Rectangle {
            width: 10
            height: 30
            color: "transparent"
        }

    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 260
            easing.type: Easing.OutCubic
        }

    }

}
