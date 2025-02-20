#!/bin/bash

# Define the output file
OUTPUT_FILE="flatpak-apps.txt"

# Save the list of installed Flatpak applications
flatpak list --app --columns=application > "$OUTPUT_FILE"

echo "Flatpak application list saved to $OUTPUT_FILE"
