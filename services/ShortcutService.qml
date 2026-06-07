import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import qs.components

Item {
    IpcHandler {
        enabled: true
        target: "trigger"
        function handle(action: string): void {
            Shortcuts.trigger(action)
        }
    }
}
