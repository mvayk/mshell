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

        margins.right: 400
        margins.left: 400
        margins.top: DefaultTheme.margin

        RowLayout {
            id: row
            anchors.left: parent.left
            anchors.leftMargin: DefaultTheme.margin
            anchors.verticalCenter: parent.verticalCenter
            spacing: DefaultTheme.spacing

            Workspaces {
                screen: root.screen
                Layout.preferredWidth: 12 * count
            }

            Item { Layout.fillWidth: true }
        }

        Text {
            id: clock
            anchors.right: parent.right
            anchors.rightMargin: DefaultTheme.margin
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
