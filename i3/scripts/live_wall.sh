#!usr/bin/env sh

wallpaper_name="Serenity-Anime-Girl-Landscape-Live-Wallpaper.mp4"
wallpaper_folder="$HOME/.config/wallpaper/"
walpaper_path="$wallpaper_folder$wallpaper_name"

# Starts live wallpaper on monitor 1
xwinwrap \
-g 1360x768+0+0 \
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

# Starts live wallpaper on monitor 2
xwinwrap \
-g 1366x768+1390+0 \
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


