#!/bin/bash

mkdir -p ./.config
cp -r ~/.config/fastfetch ./.config/
cp -r ~/.config/nvim ./.config/
cp -r ~/.config/quickshell ./.config/
cp -r ~/.config/hypr ./.config/
cp -r ~/.config/kitty ./.config/
cp ~/.tmux.conf ./

mkdir -p ./.local/share/applications
cp ~/.local/share/applications/settings.desktop ./.local/share/applications/
