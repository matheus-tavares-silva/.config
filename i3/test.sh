zprofile=~/.zprofile

#

if ! test -n "`pgrep xwinwrap`"; then
    sh $HOME/.config/i3/scripts/live_wall.sh
fi
