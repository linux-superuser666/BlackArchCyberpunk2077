#!/bin/bash

COVER="/tmp/.music_cover.jpg"
TMP="/tmp/.music_cover_raw.png"
DEFAULT="$HOME/.config/quickshell/assets/images/music.png"
MUSIC_DIR="$HOME/Music"

file=$(mpc --format %file% current)

# kosong / radio stream
if [[ -z "$file" || "$file" =~ ^http ]]; then
    echo "$DEFAULT"
    exit 0
fi

song_path="$MUSIC_DIR/$file"

# file tidak ada
if [[ ! -f "$song_path" ]]; then
    echo "$DEFAULT"
    exit 0
fi

# extract embedded cover
ffmpeg -y -loglevel error \
  -i "$song_path" \
  -map 0:v:0 "$TMP" 2>/dev/null

if [[ -s "$TMP" ]]; then
    magick "$TMP" -background "#111017" -alpha remove -alpha off "$COVER"
    rm -f "$TMP"
    echo "$COVER"
else
    echo "$DEFAULT"
fi
