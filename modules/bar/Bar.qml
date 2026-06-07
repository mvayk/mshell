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
        //color: DefaultTheme.base

        margins.right: 400
        margins.left: 400
        margins.top: DefaultTheme.margin

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            implicitHeight: 30
            color: DefaultTheme.base

            bottomLeftRadius: DefaultTheme.radiusExtra
            topLeftRadius: DefaultTheme.radiusExtra
            bottomRightRadius: DefaultTheme.radiusExtra
            topRightRadius: DefaultTheme.radiusExtra

            RowLayout {
                id: rowLeft
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
        }

        RowLayout {
            id: rowCenter
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Text {
                text: niri.focusedWindow?.title ?? ""
                font.family: DefaultTheme.fontFamily
                font.pixelSize: DefaultTheme.fontSize - 2
                color: DefaultTheme.muted
            }
        }

        RowLayout {
            id: rowRight
            anchors.right: parent.right
            anchors.rightMargin: DefaultTheme.margin
            anchors.verticalCenter: parent.verticalCenter
            spacing: DefaultTheme.spacing

            Time { }
        }
    }
}
