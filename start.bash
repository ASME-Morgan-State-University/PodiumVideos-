#!/usr/bin/env bash

# Play the configured video fullscreen. Add this script to the desktop
# environment's startup applications to run it automatically on boot.
set -euo pipefail

VIDEO_DIR="/home/pi/PodiumVideos-"
VIDEO_NAME="video0.mp4"
video="$VIDEO_DIR/$VIDEO_NAME"

if [[ ! -f "$video" ]]; then
	echo "Video not found: $video" >&2
	exit 1
fi

exec mpv --fs --loop=inf --no-osd-bar "$video"
