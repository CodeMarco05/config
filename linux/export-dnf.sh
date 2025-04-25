#!/bin/bash

# Define output file
OUTPUT_FILE="dnf-packages.txt"

# Get user-installed packages and save to file
dnf history userinstalled | awk '{print $1}' | tail -n +3 | sort > "$OUTPUT_FILE"

echo "User-installed package list saved to $OUTPUT_FILE"

