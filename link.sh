#!/bin/bash

DIRS_FILE="dirs.txt"

# Ensure the file exists
touch "$DIRS_FILE"

# Read directories from the file
mapfile -t dirs < "$DIRS_FILE"

# Prompt the user
echo "Do you want to create symlinks for:"
echo "1) A single directory"
echo "2) All directories"
echo "3) Quit"
read -p "Enter choice (1/2/3): " choice

# Function to create symlink with optional backup
create_symlink() {
    local dir="$1"
    local target="$HOME/.config/$dir"

    if [ -d "$target" ] || [ -L "$target" ]; then
        read -p "$dir already exists. Backup and replace? (y/n): " confirm
        if [[ "$confirm" == "y" ]]; then
            mv "$target" "$HOME/.config/${dir}_backup"
            echo "Backed up $dir to ${dir}_backup."
        else
            echo "Skipping $dir."
            return
        fi
    fi

    ln -s "$(pwd)/$dir" "$target"
    echo "Created symlink for $dir."
}

if [[ "$choice" == "1" ]]; then
    echo "Select a directory to link (or choose Quit to exit):"
    select dir in "${dirs[@]}" "Quit"; do
        if [[ "$dir" == "Quit" ]]; then
            echo "Exiting."
            exit 0
        elif [[ -n "$dir" ]]; then
            create_symlink "$dir"
            break
        else
            echo "Invalid selection. Try again."
        fi
    done
elif [[ "$choice" == "2" ]]; then
    for dir in "${dirs[@]}"; do
        create_symlink "$dir"
    done
elif [[ "$choice" == "3" ]]; then
    echo "Exiting."
    exit 0
else
    echo "Invalid choice. Exiting."
    exit 1
fi

