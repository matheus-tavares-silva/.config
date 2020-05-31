#!/bin/sh

sleep 0.7;

B='#FCFCFC00'  # blank
C='#30303050'  # clear ish
D='#303030A0'  # default
K='#30303090'  # default
T='#FCFCFCee'  # text
W='#880000bb'  # wrong
V='#303030B1'  # verifying

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
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$T       \
--bshlcolor=$V        \
\
--screen 1            \
--blur 2              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2         \
--veriftext="Wait" \
--wrongtext="Fail" \
#--textsize=20 \
--modsize=50 \
--timefont=SF Pro Diplay \
--datefont=SF Pro Display \
# etc