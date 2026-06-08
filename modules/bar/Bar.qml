import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.components

Variants {
    model: Quickshell.screens;
    PanelWindow {
        id: root
        required property var modelData
        screen: modelData
        anchors.top: true
        anchors.left: true
        anchors.right: true
        implicitHeight: 30
        margins.top: 10
        color: "transparent"

        Item {
            anchors.fill: parent
            anchors.leftMargin: DefaultTheme.spacing
            anchors.rightMargin: DefaultTheme.spacing

            Island {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                Row {
                    id: workspaceRow
                    spacing: DefaultTheme.spacing
                    Workspaces { screen: root.screen }
                }
            }

            Island {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                visible: niri.focusedWindow !== null
                Text {
                    id: windowTitle
                    text: niri.focusedWindow?.title ?? ""
                    font.family: DefaultTheme.fontFamily
                    font.pixelSize: DefaultTheme.fontSize - 2
                    font.bold: true
                    color: DefaultTheme.text
                }
            }

            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: DefaultTheme.spacing

                Island {
                    Brightness {
                        id: brightnessWidget
                    }
                    Battery {
                        id: batteryWidget
                    }
                }

                Island {
                    Time {
                        id: timeWidget
                    }
                }
            }
        }
    }
}
