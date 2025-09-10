# the MINECRAFT style ricing dotfiles for Nixos

CAUTION: Still in development, use at your own risk !

This repo contains hooss-only/dotfiles-minecraft-style for Nixos (the original repo is for Arch btw).

https://github.com/user-attachments/assets/bb3774c7-d3fe-428a-a551-7c9c20ec12bd

Inspired by rivendell-hyprdots of zacoons,<br>
https://codeberg.org/zacoons/rivendell-hyprdots/


# HOW TO INSTALL (Nixos)

Before doing anything modify the flake with your username instead of mana !

To test this rice on NIXOS use:

```bash
sudo nixos-rebuild switch --flake github:mana-byte/dotfiles-minecraft-style.nixos#minecraft --impure --no-write-lock-file
```

It will create a new user called mana with the rice.

To install on your current user use: (Remember to backup you config files first !)

```bash
git clone https://github.com/mana-byte/dotfiles-minecraft-style.nixos.git

# change mana with your username in flake.nix and the other files below
# Add the packages you want in flake.nix

cd dotfiles-minecraft-style.nixos
sudo nixos-rebuild switch --flake .#minecraft --impure --no-write-lock-file
```

You also need to change mana with your username in the following files:
Config.qml, Hunger.qml, McHalfButton.qml, McSlider.qml, McButton.qml, Surface.qml

NOTE: If the imgborders plugin doesn't work you can compile and install it using => https://github.com/mana-byte/imgborders


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
My project is MIT License<br>
<br>
Used [Minecraft](https://github.com/IdreesInc/Minecraft-Font) font<br>
<br>
This project is not an official Minecraft product.<br>
It is not approved by or associated with Mojang or Microsoft.<br>
Minecraft © Mojang AB.<br>

# SPONSOR
As I'm very kid I have no source of earning. If you want to help me and see more these beautiful works, you can help me with [ko-fi](https://ko-fi.com/hooss)
