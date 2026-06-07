import QtQuick
import QtQuick.Layouts
import qs.components

Item {
    id: root
    implicitWidth: clock.implicitWidth
    implicitHeight: clock.implicitHeight

    Text {
        id: clock
        anchors.centerIn: parent
        color: DefaultTheme.text
        font {
            family: DefaultTheme.fontFamily
            pixelSize: DefaultTheme.fontSize
            bold: true
        }
        text: Qt.formatDateTime(new Date(), "HH:mm")

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
        }
    }
}
