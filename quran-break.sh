#!/bin/bash

# Path to the directory containing images
IMAGE_DIR="/home/hasanweb/hasanweb/programming/quran-break/images"

# Get screen resolution using xrandr (assumes primary monitor)
SCREEN_WIDTH=$(xrandr | grep '*' | awk '{print $1}' | cut -d'x' -f1)
SCREEN_HEIGHT=$(xrandr | grep '*' | awk '{print $1}' | cut -d'x' -f2)

# Infinite loop to open and close feh every hour
while true; do

  sleep 1800

  # Select a random image from the directory
  IMAGE_PATH=$(find "$IMAGE_DIR" -type f | shuf -n 1)

  # Get image dimensions using identify from ImageMagick
  IMAGE_WIDTH=$(identify -format "%w" "$IMAGE_PATH" 2>/dev/null)
  IMAGE_HEIGHT=$(identify -format "%h" "$IMAGE_PATH" 2>/dev/null)

  # Open the selected image with feh using dynamically calculated geometry in the background
  feh --geometry ${SCREEN_WIDTH}x${SCREEN_HEIGHT} "$IMAGE_PATH" &>/dev/null &

  # Let the image display for 5 seconds
  sleep 30

  # Close all instances of feh
  pkill feh &>/dev/null

  # Wait a short time to ensure feh has closed properly
  sleep 2
done
