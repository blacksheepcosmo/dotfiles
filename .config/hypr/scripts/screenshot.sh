#!/bin/bash

# Takes screenshot of all monitors and notifies you

echo "Getting DTG"
DTG=$(date +"%d%b%Y%H%M%S")

echo "DTG: $DTG"

echo "Saving png"
FILENAME=/home/echo/pictures/screenshot_$DTG.png
grim "$FILENAME"
echo "Saved as $FILENAME"

notify-send "Screenshot Taken" "Saved as $FILENAME"
