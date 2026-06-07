import QtQuick
import QtQuick.Layouts
import qs.components
import Quickshell
import Quickshell.Io

Item {
    id: root
    visible: false
    implicitWidth: brightnessText.implicitWidth
    implicitHeight: brightnessText.implicitHeight

    property int brightness: 0
    property int maxBrightness: 100

    FileView {
        id: brightnessReader
        path: "/sys/class/backlight/intel_backlight/brightness"
        onTextChanged: root.brightness = parseInt(text.trim()) || 0
    }

    FileView {
        id: maxBrightnessReader
        path: "/sys/class/backlight/intel_backlight/max_brightness"
        onTextChanged: root.maxBrightness = parseInt(text.trim()) || 100
    }

    Timer {
        interval: 5000; running: true; repeat: true
        onTriggered: { brightnessReader.reload(); maxBrightnessReader.reload() }
    }

    Text {
        id: brightnessText
        color: DefaultTheme.text
        text: "󰃠 " + Math.round((root.brightness / root.maxBrightness) * 100) + "%"
        font {
            family: DefaultTheme.fontFamily
            pixelSize: DefaultTheme.fontSize
            bold: true
        }
    }
}
