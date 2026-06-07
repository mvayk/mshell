import QtQuick
import qs.components

Item {
    id: root
    default property alias content: row.children
    implicitWidth: row.implicitWidth + DefaultTheme.margin * 2
    implicitHeight: 30

    Rectangle {
        id: inner
        anchors.centerIn: parent
        width: row.implicitWidth + DefaultTheme.margin * 2
        height: 30
        color: DefaultTheme.base
        radius: DefaultTheme.radiusExtra

        Row {
            id: row
            anchors.centerIn: parent
            spacing: DefaultTheme.spacing
        }
    }
}
