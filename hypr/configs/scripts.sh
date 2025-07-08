#!/bin/bash

terminal() {
    kitty &
}

browser() {
	firefox &
}

screenshot() {
    mkdir -p ~/Pictures

    last_num=$(ls ~/Pictures/Screenshot\ \([0-9]*\).png 2>/dev/null | \
        grep -o '([0-9]*)' | tr -d '()' | sort -n | tail -n 1)

    if [[ -z "$last_num" ]]; then
        next_num=1
    else
        next_num=$((last_num + 1))
    fi

    grim -g "$(slurp)" ~/Pictures/Screenshot\ \($next_num\).png
}

app_launcher() {
    wofi --show drun
}

kill_active_process() {
	active_pid=$(hyprctl activewindow -j | jq '.pid')

	if [[ -n "$active_pid" ]]; then
		kill "$active_pid"

		sleep 0.5
		if kill -0 "$active_pid" 2>/dev/null; then
			kill -9 "$active_pid"
		fi
	fi
}

inc_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ +5%
}

dec_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ -5%
}

refresh() {
    hyprctl dispatch dpms off
    sleep 0.5
    hyprctl dispatch dpms on

    sleep 0.2
    hyprctl reload

    sleep 0.2
    killall -q waybar
    while pgrep -U "$UID" -x waybar >/dev/null; do sleep 1; done
    waybar &

    sleep 0.2
    killall -q hyprpaper
    while pgrep -U "$UID" -x hyprpaper >/dev/null; do sleep 1; done
    hyprpaper &
}

case "$1" in
	--inc_volume)
        	inc_volume
        	;;
    	--dec_volume)
        	dec_volume
        	;;
    	--kill_active_process)
        	kill_active_process
        	;;
    	--refresh)
        	refresh
        	;;
    	--screenshot)
        	screenshot
        	;;
    	--app_launcher)
        	app_launcher
        	;;
    	--terminal)
		terminal
		;;
	--browser)
		browser
		;;
    	*)
        exit 1
        ;;
esac

