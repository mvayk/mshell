import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import Niri

import "modules/bar/"
import "modules/launcher/"
import "./components" as Components
import "./services" as Services

ShellRoot{
    id: mshell

    Niri {
        id: niri

        Component.onCompleted: connect()

        onConnected: console.info("Connected to niri")
        onErrorOccurred: function(error) {
            console.error("Niri error:", error)
        }
    }

    LazyLoader{ active: true; component: Bar{} }
}
