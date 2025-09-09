import QtQuick
import Quickshell.Io

MouseArea {
        id: root
        required property var text
        required property var func
        property bool disabled: false

        width: buttonImg.width * 2
        height: buttonImg.height * 2

        hoverEnabled: true

        onEntered: () => {
                buttonImg.source = disabled ? "assets/half_button_disabled.png" : "assets/half_button_highlighted.png"
        }

        onExited: () => {
                buttonImg.source = disabled ? "assets/half_button_disabled.png" : "assets/half_button.png"
        }

        onClicked: () => {
                if (!disabled) {
                        playClick.running = true
                        root.func()
                }
        }
        
        Image {
                x: width/2
                y: height/2
                id: buttonImg
                scale: 2
                source: root.disabled ? "assets/half_button_disabled.png" : "assets/half_button.png"
                smooth: false
        }

        Text {
                anchors.centerIn: parent
                text: root.text
                font.family: minecraft.font.family
                font.pixelSize: 14
                color: "black"

                Text {
                        x: -1
                        y: -1
                        text: root.text
                        font.family: minecraft.font.family
                        font.pixelSize: 14
                        color: "white"
                }
        }

        Process {
                id: playClick
                running: false
                command: ["play", "--no-show-progress", "/home/mana/.config/quickshell/components/assets/click.ogg"]
        }

        FontLoader {
                id: minecraft
                source: "../assets/Minecraft.otf"
        }
}
