pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

PanelWindow {
        id: root

        required property Controller controller

        anchors {
                left: true
                right: true
                top: true
                bottom: true
        }
}
