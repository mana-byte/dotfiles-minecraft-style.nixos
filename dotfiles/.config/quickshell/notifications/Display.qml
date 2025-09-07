import QtQuick
import Quickshell.Services.Notifications

Item {
        id: root
        x: 300
        y: 15

        required property var notif

        implicitWidth: 160 * 2
        implicitHeight: background.height * 2

        Image {
                id: background
                source: "assets/advancement.png"
                scale: 2
                smooth: false
                 
                Image {
                        source: root.notif.appIcon != "" ?
                                `file:///${root.notif.appIcon}` :
                                "assets/diamond.png"

                        smooth: false
                        x: 8
                        y: 8
                }

                Column {
                        anchors.left: parent.left
                        padding: 5
                        leftPadding: 28
                        spacing: 2

                        Text {
                                text: root.notif.summary
                                font.family: minecraft.font.family
                                font.pixelSize: 9
                                color: root.notif.urgency == NotificationUrgency.Critical ?
                                        "#FF55FF" :
                                        "#FFFF55"
                                smooth: false
                        }

                        Text {
                                function getText() {
                                        let length = 21;
                                        let body = root.notif.body;
                                        if (body.length > length) {
                                                return body.substring(0, length-3) + '...';
                                        }

                                        let index = body.indexOf('\n')
                                        if (index > -1) {
                                                return body.substring(0, index) + '...';
                                        }
                                        return body
                                }

                                text: getText()
                                font.family: minecraft.font.family
                                font.pixelSize: 9
                                color: "#FFFFFF"
                                smooth: false
                        }
                }
        }

        FontLoader {
                id: minecraft
                source: "../assets/Minecraft.otf"
        }
}

