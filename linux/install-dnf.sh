#!/bin/bash

# Define input file
INPUT_FILE="dnf-packages.txt"

# Check if file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: $INPUT_FILE not found!"
    exit 1
fi

# Install each package
xargs -a "$INPUT_FILE" -r sudo dnf install -y

echo "All user-installed DNF packages have been installed."

