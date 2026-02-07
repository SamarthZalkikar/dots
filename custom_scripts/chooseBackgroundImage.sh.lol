#!/bin/bash

folder="$HOME/Pictures/wallpapers/artdroiiid_ii/"

# 1. Prepare the list for Rofi
list_items=""
while IFS=$'\t' read -r name path; do
  list_items+="${path}\0icon\x1f${path}\n"
done < <(find "$folder" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -printf "%f\t%p\n")

# 2. Show Rofi as a pure Image Picker (No input bar)
selected=$(echo -e "$list_items" | rofi -dmenu -i -p "Walls" \
  -show-icons \
  -theme-str '
        configuration { 
            show-icons: true; 
        } 
        window { 
            width: 850px; 
            border: 2px;
            border-color: #ffffff22;
        } 
        mainbox { 
            children: [ listview ]; 
        } 
        inputbar { 
            enabled: false; 
        } 
        listview { 
            columns: 3; 
            lines: 3; 
            spacing: 15px;
            padding: 20px;
            fixed-height: false;
        } 
        element { 
            orientation: vertical; 
            padding: 10px;
            border-radius: 8px;
        } 
        element-text { 
            enabled: false; 
        } 
        element-icon { 
            size: 250px; 
            horizontal-align: 0.5; 
        }
    ')

if [ -n "$selected" ]; then
  full_path="$selected"

  # swww transition
  if command -v swww >/dev/null 2>&1; then
    swww img "$full_path" --transition-type center --transition-pos 0.5,0.5 --transition-step 90
  fi

  echo "$(basename "$full_path")" >"$HOME/.cache/wall.txt"
fi
