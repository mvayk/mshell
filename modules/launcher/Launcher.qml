import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland

import qs.services
import qs.components

PanelWindow {
    id: launcher
    visible: false
    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true
    color: "transparent"

    function toggle() {
        console.warn("DIE")
        visible = !visible
        if (visible) {
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 200
        height: 100

        color: DefaultTheme.base
        radius: DefaultTheme.radiusExtra
    }

    Connections {
        target: Shortcuts
        function onTriggered(action) {
            if (action === "launcher") launcher.toggle()
        }
    }
}
