pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Io
import "../components"

Column {
        id: root
        
        visible: false
        spacing: 5

        required property var stationName
        required property var wifi


        Row {
                spacing: 10

                McButton {
                        id: wifiBtn
                        text: "Wifi: " + (root.wifi.connectedNetwork)
                        func: () => {
                        }
                }

                McButton {
                        id: ipv4
                        text: "IPv4: " + (root.wifi.ipv4)
                        func: () => {
                        }
                }
        }

        Row {
                spacing: 10

                McButton {
                        text: "Disconnect"
                        func: () => {
                                disconnectWifi.running = true
                        }
                }

                McButton {
                        text: "Forget"
                        func: () => {
                        }
                }
        }

        Process {
                id: disconnectWifi
                running: false
                command: ["iwctl", "station", root.stationName, "disconnect"]
        }
}
