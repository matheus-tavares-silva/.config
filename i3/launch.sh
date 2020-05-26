#!/usr/bin/env sh

killall -q compton
pkill -9 -f auto_xset.py
killall mpv
killall xwinwrap 
killall rclone

while pgrep -u $UID -x mpv > /dev/null; do sleep 1; done && \
while pgrep -u $UID -x xwinwrap > /dev/null; do sleep 1; done

sh $HOME/.config/i3/scripts/live_wall.sh &

#Starts compton
while pgrep -u $UID -x compton > /dev/null; do sleep 1; done

compton --daemon

#Starts auto_xset
while pgrep -u $UID -f auto_xset.py > /dev/null; do sleep 1; done

$HOME/.config/i3/scripts/auto_xset.py &


while pgrep -u $UID -f rclone > /dev/null; do sleep 1; done

rclone --vfs-cache-mode writes mount googledrive: ~/Drive || \
fusermount -u ~/Drive && \
rclone --vfs-cache-mode writes mount googledrive: ~/Drive &
