#!/usr/bin/env python3
import sys
import os

# Mapping of legacy/broken codepoints to Nerd Font v3 (NFM) equivalents
# Designed for Muramasa's elite Tokyo Night setup.
REPLACEMENTS = {
    '': '󰣆', # Arch/Sway Logo
    '': '󰌢', # Laptop/Asusctl
    '': '󰮯', # Pacman Updates
    '': '󰥔', # Clock
    '': '󰃭', # Calendar
    '': '󰂛', # DND
    '': '󰈈', # Eye Open (Inhibitor)
    '': '󰈉', # Eye Closed (Inhibitor)
    '': '󰃠', # Brightness
    '': '󰕿', # Vol Mute
    '': '󰖀', # Vol Low
    '': '󰕾', # Vol High
    '': '󰝟', # Muted
    '': '󰍬', # Mic
    '': '󰍭', # Mic Mute
    '': '󰂯', # Bluetooth
    '': '󰤨', # Wifi
    '': '󰇚', # Net Down
    '': '󰕒', # Net Up
    '': '󰈀', # Ethernet
    '': '󰋊', # Disk
    '': '󰻠', # Microchip (iGPU)
    '': '󰢿', # NVIDIA (Legacy)
    '': '󰻠', # CPU
    '': '', # RAM
    '': '󰏈', # Temp
    '': '󰂄', # Charging
    '': '󰚥', # Plugged
    '': '󰂎', # Bat empty
    '': '󰁺', # Bat low
    '': '󰁽', # Bat med
    '': '󰂀', # Bat high
    '': '󰁹'  # Bat full
}

CONFIG_PATH = os.path.expanduser('~/.config/waybar/config')

def update_icons():
    if not os.path.exists(CONFIG_PATH):
        print(f"Error: {CONFIG_PATH} not found.")
        return

    with open(CONFIG_PATH, 'r', encoding='utf-8') as f:
        content = f.read()

    count = 0
    for old, new in REPLACEMENTS.items():
        if old in content:
            content = content.replace(old, new)
            count += 1

    with open(CONFIG_PATH, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"Successfully updated icon types to Nerd Font v3.")

if __name__ == "__main__":
    update_icons()
