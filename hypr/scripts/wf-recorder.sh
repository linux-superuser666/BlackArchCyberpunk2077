#!/usr/bin/env bash

SAVE_DIR="$HOME/Videos/recordings"
PIDFILE="/tmp/wf-recorder.pid"
RASI="$HOME/.config/rofi/recorder.rasi"

mkdir -p "$SAVE_DIR"

get_audio_monitor() {
    pactl list short sources \
        | grep -i monitor \
        | awk '{print $2}' \
        | head -n1
}

FILENAME="$SAVE_DIR/record_$(date +'%Y-%m-%d_%H-%M-%S').mp4"

CHOICE=$(printf "🖥️ Screen (720p)\n🟩 Area (720p)\n🎙️ Screen + Audio (720p)\n❌ Stop Recording" \
    | rofi -dmenu -theme "$RASI" -p "Recorder")

case "$CHOICE" in

"🖥️ Screen (720p)")
    notify-send "Recording" "Screen only"
    wf-recorder \
        --framerate 30 \
        --pixel-format yuv420p \
        --size 1280x720 \
        -f "$FILENAME" &
    echo $! > "$PIDFILE"
    ;;

"🟩 Area (720p)")
    notify-send "Recording" "Area select"
    slurp | wf-recorder \
        -g - \
        --framerate 30 \
        --pixel-format yuv420p \
        --size 1280x720 \
        -f "$FILENAME" &
    echo $! > "$PIDFILE"
    ;;

"🎙️ Screen + Audio (720p)")
    DEVICE=$(get_audio_monitor)

    if [ -z "$DEVICE" ]; then
        notify-send "❌ Error" "Audio monitor not found"
        exit 1
    fi

    notify-send "Recording" "Screen + Audio"
    wf-recorder \
        --audio-backend=pipewire \
        -a "$DEVICE" \
        --audio-codec aac \
        --sample-rate 48000 \
        --framerate 30 \
        --pixel-format yuv420p \
        --size 1280x720 \
        -f "$FILENAME" &
    echo $! > "$PIDFILE"
    ;;

"❌ Stop Recording")
    if [ -f "$PIDFILE" ]; then
        kill -INT "$(cat "$PIDFILE")"
        rm -f "$PIDFILE"
        notify-send "Recording stopped" "Saved:\n$FILENAME"
    else
        notify-send "No active recording"
    fi
    ;;

*)
    exit 0
    ;;
esac
