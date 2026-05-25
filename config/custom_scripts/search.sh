#!/usr/bin/env bash

# 1. Configuration
SEARCH_ENGINE="https://www.google.com/search?q="

# 2. Get input from Rofi
QUERY=$(echo "" | rofi -dmenu -p "🔍 Google Search" -l 0)

# 3. Exit if empty
if [ -z "$QUERY" ]; then
  exit 0
fi

# 4. Smart Check: Is it a URL?
if [[ "$QUERY" =~ ^https?:// ]] || [[ "$QUERY" =~ \.(com|net|org|io|gov|edu|me|tv|local)$ ]]; then
  [[ ! "$QUERY" =~ ^https?:// ]] && QUERY="https://$QUERY"
  xdg-open "$QUERY"
else
  # 5. NEW & FIXED: URL Encoding using pure bash/jq or python
  # This replaces the buggy curl line with a more stable method
  ENCODED_QUERY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$QUERY'))")

  xdg-open "$SEARCH_ENGINE$ENCODED_QUERY"
fi
