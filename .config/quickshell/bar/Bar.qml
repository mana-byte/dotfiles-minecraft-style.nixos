import Quickshell
import QtQuick

PanelWindow {
        id: bar
	anchors {
		bottom: true
		left: true
		right: true
        }

	implicitHeight: 80
        color: "transparent"

        Hotbar {
        }

}
