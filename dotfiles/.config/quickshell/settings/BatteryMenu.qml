pragma ComponentBehavior: Bound

import QtQuick
import "../components"
import ".."

Column {
        id: root
        
        visible: false
        spacing: 5

        property int maxBrightness: 0
        property int brightness: 0

        property var config: Config.json

        Row {
                spacing: 5

                McSlider {
                        text: "Low Battery"
                        initialValue: root.config.battery.low

                        onPercentageChanged: () => {
                                root.config.battery.low = percentage
                                Config.write()
                        }
                }
        }
}
