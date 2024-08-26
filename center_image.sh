#!/bin/bash

# Check if an image filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <image_filename>"
  exit 1
fi

# Set the screen resolution (adjust this if needed)
SCREEN_WIDTH=2560
SCREEN_HEIGHT=1080

# Get the image dimensions using identify from ImageMagick
IMAGE_WIDTH=$(identify -format "%w" "$1")
IMAGE_HEIGHT=$(identify -format "%h" "$1")

# Calculate the position to center the image window on the screen
OFFSET_X=$(((SCREEN_WIDTH - IMAGE_WIDTH) / 2))
OFFSET_Y=$(((SCREEN_HEIGHT - IMAGE_HEIGHT) / 2))

# Open the image using feh and center it on the screen
feh --geometry ${IMAGE_WIDTH}x${IMAGE_HEIGHT}+${OFFSET_X}+${OFFSET_Y} "$1"
