#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar && \

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

polybar bar0 >>/tmp/polybar1.log 2>&1 &
polybar bar1 >>/tmp/polybar2.log 2>&1 &


killall -q redshift

while pgrep -u $UID -x redshift > /dev/null; do sleep 1; done

redshift -c $HOME/.config/redshift.conf