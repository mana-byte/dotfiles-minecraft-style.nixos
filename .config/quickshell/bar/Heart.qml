import QtQuick

Item {
        Row {
                spacing: -1
                Repeater {
                        model: 10
                        Image {
                                source: "assets/heart/container.png"
                                smooth: false
                        }
                }
        }
        Row {
                spacing: -1
                Repeater {
                        model: 10
                        Image {
                                source: "assets/heart/full.png"
                                smooth: false
                        }
                }
        }
}
