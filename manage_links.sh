#!/bin/bash

DIRS_FILE="dirs.txt"

# Ensure the file exists
touch "$DIRS_FILE"

# Function to display current directories
show_dirs() {
    echo "Current directories in the list:"
    if [[ ! -s "$DIRS_FILE" ]]; then
        echo "(No directories added yet.)"
    else
        cat "$DIRS_FILE"
    fi
}

# Function to add a directory
add_dir() {
    read -p "Enter the director name to add: " new_dir
    if grep -Fxq "$new_dir" "$DIRS_FILE"; then
        echo "$new_dir is already in the list."
    else
        echo "$new_dir" >> "$DIRS_FILE"
        echo "Added $new_dir to the list."
    fi
}

# Function to remove a directory
remove_dir() {
    show_dirs
    read -p "Enter the directory name to remove: " remove_dir
    if grep -Fxq "$remove_dir" "$DIRS_FILE"; then
        grep -Fxv "$remove_dir" "$DIRS_FILE" > temp.txt && mv temp.txt "$DIRS_FILE"
        echo "Removed $remove_dir from the list."
    else
        echo "$remove_dir is not in the list."
    fi
}

# Menu
echo "Manage directories for linking:"
echo "1) Show current directories"
echo "2) Add a directory"
echo "3) Remove a directory"
echo "4) Quit"
read -p "Enter your choice (1-4): " choice

case $choice in
    1) show_dirs ;;
    2) add_dir ;;
    3) remove_dir ;;
    4) echo "Exiting."; exit 0 ;;
    *) echo "Invalid choice."; exit 1 ;;
esac
