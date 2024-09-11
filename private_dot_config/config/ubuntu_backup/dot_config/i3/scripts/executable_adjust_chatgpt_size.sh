#!/bin/bash

WIDTH=1000
HEIGHT=1000

i3-msg "move position center; [class=\"synonym_ai\"] scratchpad show"
# Show the scratchpad window

# Get dimensions of the currently focused monitor (idk why it is working. if this is removed it is not working)
read -r X Y W H < <(i3-msg -t get_outputs | jq -r '.[] | select(.current_workspace != null) | "\(.rect.x) \(.rect.y) \(.rect.width) \(.rect.height)"')

# Resize and move the scratchpad window
i3-msg "[class=\"synonym_ai\"] resize set $WIDTH $HEIGHT"
