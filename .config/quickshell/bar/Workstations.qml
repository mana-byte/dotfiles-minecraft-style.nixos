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

        Repeater {
                model: 9
                Image {
                        required property int index

                        function getImage() {
                                for (let i=0; i<9; i++) {
                                        if (Hyprland.workspaces.values[i] == null) {
                                                continue;
                                        }

                                        if (Hyprland.workspaces.values[i].id == index+1) {
                                                let workspace = Hyprland.workspaces.values[i]
                                                let asset =  "assets/items/diamond_pickaxe.png"

                                                workspace.toplevels.values.forEach(toplevel => {
                                                        if (['vi', 'vim', 'nvim'].includes(toplevel.title)) {
                                                                asset = "assets/items/writable_book.png"
                                                                return
                                                        }

                                                        if (toplevel.title.includes('Zen Browser')) {
                                                                asset = "assets/items/compass_13.png"
                                                                return
                                                        }

                                                        if (toplevel.title.includes('Discord')) {
                                                                asset = "assets/items/oak_sign.png"
                                                                return
                                                        }
                                                });

                                                return asset
                                        }
                                }
                                return ""
                        }

                        source: getImage() 
                        x: 20 * index + 3
                        y: 3
                        smooth: false
                }
        }
        
        Image {
                x: 20 * (Hyprland.focusedWorkspace.id - 1)

		source: "assets/hotbar_selection.png"
                fillMode: Image.PreserveAspectFit
                smooth: false
        }

        
}
