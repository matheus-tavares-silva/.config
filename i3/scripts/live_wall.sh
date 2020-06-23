#!usr/bin/env sh

killall xwinwrap

wallpaper_name="Serenity2.mpv"
wallpaper_folder="$HOME/.config/wallpaper/"
walpaper_path="$wallpaper_folder$wallpaper_name"

echo "Starting live wallpaper...\n"

while pgrep -x xwinwrap > /dev/null; do sleep 1; done
#sh $script/live_wall.sh &

# Starts live wallpaper on monitor 1
xwinwrap \
-g 2732x768+0+0 \
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

echo "Done...\n\n"
