#!/usr/bin/env bash
cache_file="$HOME/.cache/toggle_animation"
if grep -q 'animations *= *"disabled"' "$HOME/.config/hypr/conf/variants.lua"; then
    echo ":: Toggle blocked by the disabled animations variant."
else
    if [ -f $cache_file ]; then
        hyprctl keyword animations:enabled true
        rm $cache_file
    else
        hyprctl keyword animations:enabled false
        touch $cache_file
    fi
fi
