import QtQuick
import QtQuick.Layouts
import qs.components
import Quickshell
import Quickshell.Io

Item {
    id: root

    visible: false
    implicitWidth: battBody.width + nub.width + 2
    implicitHeight: battBody.height

    property int    capacity: 100
    property string status:   "Unknown"
    property bool   charging: status === "Charging"
    property bool   full:     status === "Full"

    property color fillColor: {
        if (charging || full)  return "#185FA5"
        if (capacity >= 40)    return "#1D9E75"
        if (capacity >= 20)    return "#BA7517"
        return "#E24B4A"
    }

    Timer {
        interval: 30000; running: true; repeat: true
        onTriggered: { capReader.reload(); statReader.reload() }
    }
    FileView {
        id: capReader
        path: "/sys/class/power_supply/BAT0/capacity"
        onTextChanged: root.capacity = parseInt(text().trim()) || 0
    }
    FileView {
        id: statReader
        path: "/sys/class/power_supply/BAT0/status"
        onTextChanged: root.status = text().trim()
    }
    FileView {
        id: detector
        path: "/sys/class/power_supply/BAT0/capacity"
        onLoaded: root.visible = true
        onLoadFailed: root.visible = false
    }

    Rectangle {
        id: battBody
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: 40; height: 16
        radius: 2
        color: "transparent"
        border.width: 1.5
        border.color: root.fillColor

        Rectangle {
            x: 2; y: 2
            height: parent.height - 4
            width: Math.max(0, (parent.width - 4) * root.capacity / 100)
            radius: 1
            color: root.fillColor
            Behavior on width { NumberAnimation { duration: 600; easing.type: Easing.OutCubic } }
        }

        Text {
            anchors.centerIn: parent
            text: (root.charging ? "⚡ " : "") + root.capacity + "%"
            font.family: DefaultTheme.fontFamily
            font.pixelSize: 10
            font.weight: Font.Bold
            color: "white"
            z: 1
        }
    }

    Rectangle {
        id: nub
        anchors.left: battBody.right
        anchors.leftMargin: 1
        anchors.verticalCenter: parent.verticalCenter
        width: 3; height: 6
        radius: 1
        color: root.fillColor
    }
}
