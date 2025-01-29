#!/bin/bash

for dir in hypr kitty nvim waybar; do
    if [ ! -e "$HOME/.config/$dir" ]; then
        ln -s "$(pwd)/$dir" "$HOME/.config/$dir"
        echo "Created symlink for $dir"
    else
        echo "Skipping $dir: Already exists"
    fi
done

