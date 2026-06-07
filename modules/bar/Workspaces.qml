import QtQuick
import QtQuick.Layouts
import qs.components

Item {
    id: root
    required property var screen

    implicitWidth: row.implicitWidth
    implicitHeight: 12

    Row {
        id: row
        anchors.centerIn: parent
        spacing: DefaultTheme.spacing

        Repeater {
            model: niri.workspaces
            Item {
                width:  model.output === root.screen.name ? 12 : 0
                height: 12
                visible: model.output === root.screen.name

                Rectangle {
                    anchors.centerIn: parent
                    width: 12; height: 12
                    radius: DefaultTheme.radiusSmall
                    color: model.isActive ? DefaultTheme.text : DefaultTheme.muted
                    scale: model.isActive ? 1.25 : 1.0

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: niri.focusWorkspaceById(model.id)
                    }
                }
            }
        }
    }
}
