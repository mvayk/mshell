import QtQuick
import QtQuick.Layouts

import qs.components

Item {
    id: root
    required property var screen

    Row {
        id: row
        anchors.left: parent.left
        anchors.leftMargin: DefaultTheme.margin
        anchors.verticalCenter: parent.verticalCenter
        spacing: DefaultTheme.spacing

        Repeater {
            model: niri.workspaces
            Item {
                implicitWidth: model.output === root.screen.name ? 12 : 0
                implicitHeight: model.output === root.screen.name ? 12 : 0
                visible: model.output === root.screen.name
                Rectangle {
                    anchors.fill: parent
                    radius: DefaultTheme.radiusSmall
                    color: model.isActive ? DefaultTheme.text : DefaultTheme.muted
                    scale: model.isActive ? 1.25 : 1.0
                }
            }
        }
        Item { Layout.fillWidth: true }
    }
}
