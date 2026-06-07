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
        margins.right: 10
        margins.left: 10
        margins.top: 10
        color: "transparent"
        RowLayout {
            anchors.fill: parent
            spacing: 0

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle {
                    anchors.centerIn: parent
                    height: 30
                    width: workspaceRow.implicitWidth + DefaultTheme.margin
                    color: DefaultTheme.base
                    radius: DefaultTheme.radiusExtra
                    Row {
                        id: workspaceRow
                        anchors.centerIn: parent
                        spacing: DefaultTheme.spacing
                        Workspaces { screen: root.screen }
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle {
                    anchors.centerIn: parent
                    height: 30
                    width: windowTitle.implicitWidth + DefaultTheme.margin * 2
                    color: DefaultTheme.base
                    radius: DefaultTheme.radiusExtra
                    visible: niri.focusedWindow !== null
                    Text {
                        id: windowTitle
                        anchors.centerIn: parent
                        text: niri.focusedWindow?.title ?? ""
                        font.family: DefaultTheme.fontFamily
                        font.pixelSize: DefaultTheme.fontSize - 2
                        color: DefaultTheme.muted
                    }
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Row {
                    anchors.centerIn: parent
                    spacing: DefaultTheme.spacing
                    Rectangle {
                        height: 30
                        width: batteryWidget.implicitWidth + DefaultTheme.margin * 2
                        color: DefaultTheme.base
                        radius: DefaultTheme.radiusExtra
                        Battery {
                            id: batteryWidget
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        height: 30
                        width: timeWidget.implicitWidth + DefaultTheme.margin * 2
                        color: DefaultTheme.base
                        radius: DefaultTheme.radiusExtra
                        Time {
                            id: timeWidget
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}
