import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: "#1a1b26"

    Text {
        anchors.centerIn: parent
        text: "mshell"
        color: "#a9b1d6"
        font.pixelSize: 14
    }

    Rectangle {
        Row {
            id: row
            anchors.centerIn: parent
            spacing: 8

            Repeater {
                model: niri.workspaces

                Item {
                    implicitWidth: 10
                    implicitHeight: 10

                    Rectangle {
                        anchors.fill: parent
                        radius: 5

                        color: (model.isActive || model.activeWindowId > 0) ? "#7aa2f7" : "444b6a";
                        opacity: model.isActive ? 1.0 : 0.5
                        scale: model.isActive ? 1.25 : 1.0
                    }
                }
            }
        }
        //Item { Layout.fillWidth: true }
    }
}
