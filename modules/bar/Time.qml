import QtQuick
import QtQuick.Layouts

import qs.components

Item {
    id: root
    Text {
        id: clock
        anchors.right: parent.right
        anchors.rightMargin: DefaultTheme.margin
        anchors.verticalCenter: parent.verticalCenter
        color: DefaultTheme.text
        font { family: DefaultTheme.fontFamily; pixelSize: DefaultTheme.fontSize; bold: true }
        //text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
        text: Qt.formatDateTime(new Date(), "HH:mm")
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
        }
    }
}
