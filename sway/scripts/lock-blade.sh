#!/bin/bash

#grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" /tmp/lockscreen.png && convert -filter Gaussian -resize 20% -blur 0x2.5 -resize 500% /tmp/lockscreen.png /tmp/lockscreen.png
#swaylock -e -f -i /tmp/lockscreen.png

#!/bin/bash
# Tokyonight Storm Colors
BG='#1a1b26'
FG='#c0caf5'
CYAN='#7dcfff'
PURPLE='#bb9af7'
MAGENTA='#bb9af7'
RED='#f7768e'
YELLOW='#e0af68'

swaylock \
    -e \
    -F \
    --screenshots \
    --clock \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 7x5 \
    --effect-vignette 0.5:0.5 \
    --ring-color $PURPLE \
    --key-hl-color $CYAN \
    --text-color $FG \
    --line-color $BG \
    --inside-color "${BG}88" \
    --separator-color $BG \
    --ring-ver-color $CYAN \
    --inside-ver-color "${CYAN}33" \
    --ring-wrong-color $RED \
    --inside-wrong-color "${RED}33" \
    --ring-clear-color $YELLOW \
    --inside-clear-color "${YELLOW}33" \
    --text-caps-lock-color $MAGENTA \
    --font "JetBrainsMono Nerd Font" \
    --datestr "%A, %B %d" \
    --timestr "%H:%M:%S"
