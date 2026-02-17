#!/usr/bin/env  bash

folder="$HOME/Pictures/wallpapers/zelda/"

# 1. Prepare the list for Rofi
list_items=""
while IFS=$'\t' read -r name path; do
  list_items+="${path}\0icon\x1f${path}\n"
done < <(find "$folder" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -printf "%f\t%p\n")

# 2. Show Rofi with Column-wise/Horizontal layout
selected=$(echo -e "$list_items" | rofi -dmenu -i -p "Walls" \
  -show-icons \
  -theme-str '
        configuration { 
            show-icons: true; 
        } 
        window { 
            width: 90%; 
            location: center;
            anchor: center;
            border: 2px;
            border-color: #ffffff11;
        } 
        mainbox { 
            children: [ listview ]; 
        } 
        inputbar { 
            enabled: false; 
        } 
        listview { 
            layout: horizontal;
            spacing: 20px;
            padding: 40px;
            fixed-height: true;
            scrollbar: false;
        } 
        element { 
            width: 300px;
            orientation: vertical; 
            padding: 10px;
            border-radius: 12px;
        } 
        element-text { 
            enabled: false; 
        } 
        element-icon { 
            size: 300px; 
            cursor: pointer;
        }
    ')

if [ -n "$selected" ]; then
  full_path="$selected"

  if command -v swww >/dev/null 2>&1; then
    swww img "$full_path" --transition-type center --transition-pos 0.5,0.5 --transition-step 90
  fi

  echo "$(basename "$full_path")" >"$HOME/.cache/wall.txt"
fi
