import QtQuick
import Quickshell.Io

MouseArea {
        id: root
        required property var text
        required property var clicked

        width: buttonImg.width * 2
        height: buttonImg.height * 2

        hoverEnabled: true

        onEntered: () => {
                buttonImg.source = "assets/button_highlighted.png"
        }

        onExited: () => {
                buttonImg.source = "assets/button.png"
        }

        onClicked: () => {
                playClick.running = true
                root.clicked()
        }
        
        Image {
                x: 200/2
                y: 20/2
                id: buttonImg
                scale: 2
                source: "assets/button.png"
        }

        Text {
                anchors.centerIn: parent
                text: root.text
                font.family: monocraft.font.family
                font.pixelSize: 14
                color: "black"

                Text {
                        x: -1
                        y: -1
                        text: root.text
                        font.family: monocraft.font.family
                        font.pixelSize: 14
                        color: "white"
                }
        }

        Process {
                id: playClick
                running: false
                command: ["play", "--no-show-progress", "~/.config/quickshell/components/assets/click.ogg"]
        }

        FontLoader {
                id: monocraft
                source: "../assets/Monocraft.ttf"
        }
}
