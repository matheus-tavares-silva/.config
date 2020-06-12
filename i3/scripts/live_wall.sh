#!usr/bin/env sh

wallpaper_name="Serenity2.mpv"
wallpaper_folder="$HOME/.config/wallpaper/"
walpaper_path="$wallpaper_folder$wallpaper_name"

# Starts live wallpaper on monitor 1
xwinwrap \
-g 2720x768+0+0 \
-un \
-fdt \
-ni \
-b \
-nf \
-ov \
-d \
-- \
mpv \
--hwdec=vdpau \
--vo=vdpau \
--no-audio \
--no-border \
--no-config \
--no-window-dragging \
--no-input-default-bindings \
--no-osd-bar \
--no-sub \
--no-stop-screensaver \
--wid WID \
--loop $walpaper_path
