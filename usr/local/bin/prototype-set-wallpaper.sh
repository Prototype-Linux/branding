#!/bin/bash

MARKER="$HOME/.config/prototype-wallpaper-set"
IMG="/usr/share/backgrounds/prototype/wallpaper.png"

if [ -f "$MARKER" ]; then
  exit 0
fi

sleep 2

for prop in $(xfconf-query -c xfce4-desktop -l | grep last-image); do
  xfconf-query -c xfce4-desktop -p "$prop" -s "$IMG"
done

mkdir -p "$(dirname "$MARKER")"
touch "$MARKER"
