pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Hyprland

MouseArea {
        id: root
        Image {
		source: "assets/hotbar.png"
                fillMode: Image.PreserveAspectFit
                smooth: false
        }

        Image {
                x: 20 * (Hyprland.focusedWorkspace.id - 1)

		source: "assets/hotbar_selection.png"
                fillMode: Image.PreserveAspectFit
                smooth: false
        }

        Repeater {
                model: 9
                Image {
                        required property int index

                        function getExists() {
                                for (let i=0; i<9; i++) {
                                        if (Hyprland.workspaces.values[i] == null) {
                                                continue;
                                        }

                                        if (Hyprland.workspaces.values[i].id == index+1) {
                                                return true;
                                        }
                                }
                                return false
                        }

                        source: getExists() ? "assets/diamond_pickaxe.png" : ""
                        x: 20 * index + 3
                        y: 3
                        smooth: false
                }
        }
}
