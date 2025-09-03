import QtQuick
import Quickshell

PanelWindow {
        aboveWindows: false
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore

        anchors {
                top: true
                left: true
                bottom: true
                right: true
        }
        
        Image {
                id: wallpaper
                source: "assets/wallpaper.jpg"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                smooth: false
        }
}
