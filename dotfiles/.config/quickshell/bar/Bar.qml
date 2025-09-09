import Quickshell
import QtQuick

PanelWindow {
        id: bar
        aboveWindows: false
	anchors {
		bottom: true
		left: true
		right: true
        }

	implicitHeight: 80
        color: "transparent"

        Clock {
        }

        Hotbar {
        }

        Trays {
        }

}
