pragma Singleton

import Quickshell
import QtQuick

QtObject {
    // Backgrounds
    readonly property color base:           "#0a0a0a"
    readonly property color surface:        "#141414"
    readonly property color elevated:       "#1f1f1f"
    readonly property color overlay:        "#2a2a2a"

    // Borders
    readonly property color border:         "#333333"
    readonly property color borderSubtle:   "#222222"

    // Text
    readonly property color text:           "#f0f0f0"
    readonly property color subtext:        "#a0a0a0"
    readonly property color muted:          "#606060"
    readonly property color disabled:       "#404040"

    // Interactive
    readonly property color hover:          "#ffffff18"
    readonly property color active:         "#ffffff28"
    readonly property color selected:       "#ffffff10"

    // Shape
    readonly property int radius:           0
    readonly property int radiusSmall:      0
    readonly property int radiusLarge:      0
    readonly property int spacing:          12
    readonly property int borderWidth:      1

    // Typography
    readonly property string fontFamily:    "JetBrainsMono Nerd Font"
    readonly property int fontSize:         14
}
