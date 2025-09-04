import QtQuick
import Quickshell.Io

Item {
        id: root

        Rectangle {
                color: "#85000000"
                width: clock.width+10
                height: clock.height+10
                y: 50

                Text {
                        id: clock
                        x: 5
                        y: 5
                        text:"11:11"
                        color: "white"
                        font.family: monocraft.font.family
                        font.pixelSize: 20
                }
        }
        
        

        Process {
                id: proc
                command: ["date"]
                running: true
                stdout: StdioCollector {
                        onStreamFinished: clock.text = this.text
                }

        }

        Timer {
                interval: 1000
                running: true
                repeat: true

                onTriggered: proc.running = true
        }
        
        FontLoader {
                id: monocraft
                source: "../assets/Monocraft.ttf"
        }
}
