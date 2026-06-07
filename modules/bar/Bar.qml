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

            // left — workspaces
            Rectangle {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
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

            // center — window title
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
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
                    font.bold: true
                    color: DefaultTheme.text
                }
            }

            // right — battery + time
            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
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
