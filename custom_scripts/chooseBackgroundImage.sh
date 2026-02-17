#!/usr/bin/env bash

base_folder="$HOME/Pictures/wallpapers"

category_path=$(find "$base_folder" -maxdepth 2 -type d | while read -r dir; do
  if [ -n "$(find "$dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.webp" \) -print -quit)" ]; then
    echo "${dir#$base_folder/}"
  fi
done | grep -v "^$base_folder$" | rofi -dmenu -i -p "📁 Category" -theme-str 'window { width: 30%; } listview { lines: 12; }')

[[ -z "$category_path" ]] && exit 1

if [[ "$category_path" == "$base_folder" ]]; then
  selected_dir="$base_folder"
else
  selected_dir="$base_folder/$category_path"
fi

list_items=""
while IFS=$'\t' read -r name path; do
  list_items+="${path}\0icon\x1f${path}\n"
done < <(find "$selected_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.webp" \) -printf "%f\t%p\n")

selected_wall=$(echo -e "$list_items" | rofi -dmenu -i -p "🖼️  $category_path" \
  -show-icons \
  -theme-str '
        configuration { show-icons: true; } 
        window { width: 95%; location: center; anchor: center; border: 2px; border-color: #ffffff11; } 
        mainbox { children: [ listview ]; } 
        inputbar { enabled: false; } 
        listview { layout: horizontal; spacing: 20px; padding: 40px; fixed-height: true; scrollbar: false; } 
        element { width: 300px; orientation: vertical; padding: 10px; border-radius: 12px; } 
        element-text { enabled: false; } 
        element-icon { size: 300px; cursor: pointer; }
    ')

if [ -n "$selected_wall" ]; then
  if command -v swww >/dev/null 2>&1; then
    swww img "$selected_wall" --transition-type center --transition-pos 0.5,0.5 --transition-step 90
  fi
  echo "$(basename "$selected_wall")" >"$HOME/.cache/wall.txt"
fi
