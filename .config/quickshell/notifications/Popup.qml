pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io
import "../components"

PanelWindow {
        id: root

        required property var controller

        exclusionMode: ExclusionMode.Ignore
        color: "#70000000"

        anchors {
                left: true
                right: true
                top: true
                bottom: true
        }

        MouseArea {
                anchors.fill: parent
                onClicked: {
                        root.controller.isOpen = false
                }
        }

        Item {
                x: parent.width / 2 - 234
                y: parent.height / 2 - 300

                Image {
                        x: 234/2
                        y: 300/2
                        scale: 2.0
                        source: "assets/popup.png"
                        smooth: false
                }

                Column {
                        x: 20
                        y: 20
                        spacing: 10
                        Text {
                                id: appName
                                text: root.controller.appName
                                color: "#FFFFFF"
                                font.family: monocraft.font.family
                                smooth: false
                        }

                        Text {
                                id: summary
                                text: root.controller.summary
                                color: "#FFFF55"
                                font.family: monocraft.font.family
                                font.pixelSize: 16
                                smooth: false
                        }

                        Text {
                                id: body
                                text: root.controller.body
                                width: 234*2 - 20*2
                                wrapMode: Text.WordWrap
                                color: "#FFFFFF"
                                font.family: monocraft.font.family
                                font.pixelSize: 16
                                smooth: false
                        }

                        McButton {
                                text: "Copy!"
                                func: () => {
                                        copy.running = true;
                                }
                        }
                }
        }

        Process {
                id: copy
                running: false
                command: ["wl-copy", root.controller.body]
        }

        FontLoader {
                id: monocraft
                source: "../assets/Monocraft.ttf"
        }
}
