pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

import "../components"

PanelWindow {
        id: root

        required property var controller

        property string title: "Options"

        color: "#55000000"

        exclusionMode: ExclusionMode.Ignore

        anchors {
                left: true
                right: true
                top: true
                bottom: true
        }

        Text {
                property var init: true
                id: titleText
                text: root.title
                color: "#555555"
                x: parent.width / 2 - width / 2
                y: 50
                font.family: minecraft.font.family
                font.pixelSize: 14
                
                onTextChanged: {
                        if (init) {
                                init = false
                                return
                        }
                        x = parent.width / 2 - width / 2
                }

                Text {
                        text: root.title
                        color: "white"
                        x: -1
                        y: -1
                        font.family: minecraft.font.family
                        font.pixelSize: 14
                }
        }

        Column {
                anchors.centerIn: parent
                Column {
                        id: firstMenu
                        visible: true
                        spacing: 5
                        Row {
                                spacing: 5
                                
                                McButton {
                                        text: "Video Settings..."
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Video Settings"
                                                videoMenu.visible = true
                                        }
                                }
                                McButton {
                                        text: "Music & Sounds..."
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Music & Sounds"
                                                soundMenu.visible = true
                                        }
                                }
                        }
                        Row {
                                spacing: 5
                                
                                McButton {
                                        text: "Internet..."
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Internet"
                                        }
                                }
                                McButton {
                                        text: "Bluetooth..."
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Bluetooth"
                                        }
                                }
                        }
                        Row {
                                spacing: 5
                                
                                McButton {
                                        text: "Battery..."
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Internet"
                                                batteryMenu.visible = true
                                        }
                                }
                                McButton {
                                        text: "Working..."
                                        disabled: true
                                        func: () => {
                                                firstMenu.visible = false
                                                root.title = "Bluetooth"
                                        }
                                }
                        }
                }

                SoundMenu {
                        id: soundMenu
                }

                VideoMenu {
                        id: videoMenu
                }

                BatteryMenu {
                        id: batteryMenu
                }
        }

        McButton {
                x: parent.width / 2 - width / 2
                y: parent.height - 50
                text: "Done"
                func: () => {
                        if (root.title == "Options") {
                                root.controller.isOpen = false
                        } else {
                                root.title = "Options"
                                firstMenu.visible = true
                                soundMenu.visible = false
                                videoMenu.visible = false
                                batteryMenu.visible = false
                        }
                }
        }

        FontLoader {
                id: minecraft
                source: "../assets/Minecraft.otf"
        }
}
