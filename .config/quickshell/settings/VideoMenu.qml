pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Io
import "../components"

Column {
        id: root
        
        visible: false
        spacing: 5

        property int maxBrightness: 0
        property int brightness: 0

        Row {
                spacing: 5

                McSlider {
                        text: "Brightness"
                        initialValue: root.brightness

                        onPercentageChanged: () => {
                                root.brightness = percentage
                                setBrightness.running = true
                        }
                }
        }

        /* BRIGHTNESS PROCESSES */
        Process {
                id: getBrightnessMax
                running: true
                command: ["brightnessctl", "m"]

                stdout: StdioCollector {
                        onStreamFinished: {
                                root.maxBrightness = parseInt(this.text)
                                getBrightness.running = true
                        }
                }
        }

        Process {
                id: getBrightness
                running: false
                command: ["brightnessctl", "g"]

                stdout: StdioCollector {
                        onStreamFinished: {
                                root.brightness = parseInt(this.text) / root.maxBrightness * 100
                        }
                }
        }

        Process {
                id: setBrightness
                running: false
                command: ["brightnessctl", "s", `${root.brightness}%`]
        }
}
