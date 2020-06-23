#!/usr/bin/env sh

killall compton
pkill   -f xset.py
killall polybar
killall rclone

if ! test -n "`pgrep xwinwrap`"; then
    sh $HOME/.config/i3/scripts/live_wall.sh
fi



script=$HOME/.config/i3/scripts
redshift=$HOME/.config/redshift.conf
zprofile=~/.zprofile

#config the live_wall to start before login

echo "Starting compton...\n"

while pgrep -x compton > /dev/null; do sleep 1; done

compton --daemon

echo "Done...\n\n"


echo "Starting screen sleeper...\n"

while pgrep -f xset.py > /dev/null; do sleep 1; done
$script/xset.py &

echo "Done...\n\n"

echo "Starting polybar...\n"

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
while pgrep -x polybar  > /dev/null; do sleep 1; done
polybar bar1 >> /tmp/polybar2.log 2>&1 &
polybar bar0 >> /tmp/polybar1.log 2>&1 &

echo "Done...\n\n"


echo "Starting rclone...\n"

while pgrep -f rclone > /dev/null; do sleep 1; done
rclone --vfs-cache-mode writes mount googledrive: ~/Drive || \
fusermount -u ~/Drive && \
rclone --vfs-cache-mode writes mount googledrive: ~/Drive &

echo "Done...\n\n"


echo "Starting redshift...\n"

while pgrep -x redshift > /dev/null; do sleep 1; done
redshift -P &

echo "Done...\n\n"


if test -f $(which zsh); then
    if ! test -f "$zprofile"; then
        touch $zprofile && \
        echo 'sh $HOME/.config/i3/scripts/live_wall.sh &' >> $zprofile
    else  
        if ! test -n "`grep live_wall $zprofile`"; then
            echo 'sh $HOME/.config/i3/scripts/live_wall.sh &' >> $zprofile
        fi
    fi
fi
