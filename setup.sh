#!/usr/bin/env bash

set -euo pipefail

# install requirements
sudo pacman -S hyprland hyprpaper hyprlock wofi waybar swaync hyprshot satty alacritty fish fastfetch ttf-nerd-fonts-symbols otf-font-awesome

# make backup
BACKUP="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
if [[ -d "$HOME/.config" ]]; then
  cp -a "$HOME/.config" "$BACKUP"
  echo "Existing configs backed up to $BACKUP"
fi

# install dotfiles
rsync -a --delete .config/ "$HOME/.config/"
rsync -a --delete wallpapers/ "$HOME/wallpapers/"

# enable scripts
find "$HOME/.config" -name "*.sh" -exec chmod +x {} \;

