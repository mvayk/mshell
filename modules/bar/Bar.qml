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

        property int cpuUsage: 0
        property int memUsage: 0
        property var lastCpuIdle: 0
        property var lastCpuTotal: 0

        anchors.top: true
        anchors.left: true
        anchors.right: true
        implicitHeight: 30
        color: DefaultTheme.base

        Row {
            id: row
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            spacing: DefaultTheme.spacing

            Repeater {
                model: niri.workspaces
                Item {
                    implicitWidth: 12
                    implicitHeight: 12
                    Rectangle {
                        anchors.fill: parent
                        radius: DefaultTheme.radiusSmall
                        color: (model.isActive || model.activeWindowId > 0) ? DefaultTheme.text : DefaultTheme.muted
                        opacity: model.isActive ? 1.0 : 0.5
                        scale: model.isActive ? 1.25 : 1.0
                    }
                }
            }

            Item { Layout.fillWidth: true }

        }

            Text {
                id: clock
                anchors.right: parent.right
                anchors.rightMargin: DefaultTheme.spacing
                anchors.verticalCenter: parent.verticalCenter
                color: DefaultTheme.text
                font { family: DefaultTheme.fontFamily; pixelSize: DefaultTheme.fontSize; bold: true }
                text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
                }
            }
    }
}
