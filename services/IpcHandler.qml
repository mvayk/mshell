import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.components

IpcHandler {
    target: "trigger"
    function handle(action: string) {
        Shortcuts.trigger(action)
    }
}
