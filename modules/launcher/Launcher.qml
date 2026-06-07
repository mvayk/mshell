import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland

import qs.components

PanelWindow {
    id: launcher
    visible: false
    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true
    color: "transparent"

    Connections {
        target: Shortcuts

        function onTriggered(action) {
            if (action == "launcher") toggle()
        }
    }

    function toggle() {
        visible = !visible
        console.log("tst")
    }
}
