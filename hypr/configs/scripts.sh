#!/bin/bash

terminal() {
	kitty &
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

debug() {
        hyprctl reload
        hyprctl dispatch reloadmonitors
        pkill waybar
        waybar &
        pkill hyprpaper
        hyprpaper &
}

case "$1" in
	--kill_active_process)
		kill_active_process
		;;
	--app_launcher)
		app_launcher
		;;
	--terminal)
		terminal
		;;
        --debug)
                debug
                ;;
	*)
	exit 1
	;;
esac
