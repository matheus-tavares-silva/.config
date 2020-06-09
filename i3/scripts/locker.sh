#!/bin/sh

sleep 0.7;

B='#E78C6D00'  # blank
C='#623a4350'  # clear ish
D='#623a43A0'  # default
K='#623a4390'  # default
T='#E78C6Dee'  # text
W='#880000bb'  # wrong
V='#623a43B1'  # verifying

i3lock \
--insidevercolor=$D   \
--ringvercolor=$K     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$K      \
--ringcolor=$C        \
--linecolor=$B        \
--separatorcolor=$V   \
\
--verifcolor=$T       \
--wrongcolor=$T       \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$T       \
--bshlcolor=$V        \
\
--screen 0            \
--blur 10             \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \
--veriftext="Wait"    \
--wrongtext="Fail"    \
--time-font="SF Pro Diplay"  \
--date-font="SF Pro Display" \
--verif-font="SF Pro Display" \
--wrong-font="SF Pro Display" \
