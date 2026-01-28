#!/usr/bin/env bash

INTERVAL=1800
CHECK_REPO="$HOME/.config/eww/scripts/system/check-repo.sh"
FINALIZER="$HOME/.config/eww/scripts/system/check-repo-finalize.sh"
iDIR="$HOME/.config/eww/icons/shockface.png"
REPOS=("core" "extra" "multilib" "blackarch")

open_window() {
    eww open update-system
}

close_window() {
    eww close update-system
}

all_repo_done() {
    for r in "${REPOS[@]}"; do
        S=$(cat "/tmp/${r}-state" 2>/dev/null)
        if [ "$S" = "running" ] || [ -z "$S" ]; then
            return 1
        fi
    done
    return 0
}

while true; do

    sleep 5
    
    notify-send "$iDIR" "CHECKING SYSTEM UPDATE" "Start Sync Mirror Database"
    sleep 5

    # reset temp files
    #rm -f /tmp/*-progress /tmp/*-state

    open_window
    sleep 1

    # jalankan semua repo dalam background
    for r in "${REPOS[@]}"; do
        bash "$CHECK_REPO" "$r" &
    done

    # tunggu sampai semua repo selesai
    while ! all_repo_done; do
        sleep 0.3
    done

    # jalankan finalizer (sekali saja)
    bash "$FINALIZER"

    close_window

    sleep "$INTERVAL"
done
