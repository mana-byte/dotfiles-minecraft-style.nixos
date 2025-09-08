# the MINECRAFT style ricing dotfiles
https://youtu.be/mBUksAx5-lU<br>
<br>
This project is a fan-made minecraft style ricing dotfiles.<br>
My project may require some modifications to work on your computer. (espacially file paths. you must change all username of absulte paths.)<br>
usage:
- hyprland
- [imgborders](https://codeberg.org/zacoons/imgborders), the hyprland plugin
- kitty
- quickshell
- neovim
- fastfetch
- pipewire
- pulseaudio
- brightnessctl
- upower
<br>
Inspired by rivendell-hyprdots of zacoons, [link](https://codeberg.org/zacoons/rivendell-hyprdots/)<br>

# HOW TO INSTALL
you can just use `install.sh` script.<br>
the script is not tested enough!! if you find some issues, please tell me.

# HOW TO
## Change Wallpaper?
1. Add wallpaper into `~/.config/quickshell/assets/wallpapers/`
2. Add filename of the image in `~/.config/quickshell/config.json`
```json
...
"wallpaper": {
        "sources": [
                "wooden_linux.jpg",
                "redstone.png",
                "your_own_wallpaper.jpg"
        ],
        "index": 0
}
...
```
3. Run settings, go to video option, change wallpaper with cool minecraft button!

# LICENSE
Used [Monocraft](https://github.com/IdreesInc/Monocraft) font<br>
This project is not an official Minecraft product.<br>
It is not approved by or associated with Mojang or Microsoft.<br>
Minecraft © Mojang AB.
