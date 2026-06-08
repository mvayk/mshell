import QtQuick
import QtQuick.Layouts
import qs.components
import Quickshell
import Quickshell.Io

Item {
    id: root
    visible: false
    implicitWidth: batteryText.implicitWidth
    implicitHeight: batteryText.implicitHeight

    property int    capacity: 100
    property string status:   "Unknown"
    property bool   charging: status === "Charging"
    property bool   full:     status === "Full"

    property color fillColor: {
        if (charging || full) return "#1D9E75"
        if (capacity >= 40)   return "#88E788"
        if (capacity >= 20)   return "#BA7517"
        return "#E24B4A"
    }

    property string batteryIcon: {
        if (charging || full) {
            if (capacity <= 10) return "󰢜"
            if (capacity <= 20) return "󰂆"
            if (capacity <= 30) return "󰂇"
            if (capacity <= 40) return "󰂈"
            if (capacity <= 50) return "󰢝"
            if (capacity <= 60) return "󰂉"
            if (capacity <= 70) return "󰢞"
            if (capacity <= 80) return "󰂊"
            if (capacity <= 90) return "󰂋"
            return "󰂅"
        }
        if (capacity <= 10) return "󰁺"
        if (capacity <= 20) return "󰁻"
        if (capacity <= 30) return "󰁼"
        if (capacity <= 40) return "󰁽"
        if (capacity <= 50) return "󰁾"
        if (capacity <= 60) return "󰁿"
        if (capacity <= 70) return "󰂀"
        if (capacity <= 80) return "󰂁"
        if (capacity <= 90) return "󰂂"
        return "󰁹"
    }

    Timer {
        interval: 30000; running: true; repeat: true
        onTriggered: { capReader.reload(); statReader.reload() }
    }

    FileView {
        id: capReader
        path: "/sys/class/power_supply/BAT0/capacity"
        onTextChanged: root.capacity = parseInt(text().trim()) || 0
        onLoaded: root.visible = true
        onLoadFailed: root.visible = false
    }

    FileView {
        id: statReader
        path: "/sys/class/power_supply/BAT0/status"
        onTextChanged: root.status = text().trim()
    }

    Text {
        id: batteryText
        anchors.centerIn: parent
        text: root.batteryIcon + " " + root.capacity + "%"
        font.family: DefaultTheme.fontFamily
        font.pixelSize: DefaultTheme.fontSize
        font.weight: Font.Bold
        color: root.fillColor
    }
}
