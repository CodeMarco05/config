#!/bin/bash

# Define the input file
INPUT_FILE="flatpak-apps.txt"

# Check if the file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: $INPUT_FILE not found!"
    exit 1
fi

# Install each Flatpak application
xargs -a "$INPUT_FILE" -I{} flatpak install -y flathub {} -P 4

echo "All Flatpak applications installed successfully."

