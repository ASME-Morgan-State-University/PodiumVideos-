#!/usr/bin/env bash

# Play the configured video fullscreen. Add this script to the desktop
# environment's startup applications to run it automatically on boot.
set -euo pipefail


VIDEO_DIR="/home/asmeehpv/PodiumVideos-"
videos=(
	"$VIDEO_DIR/video0.mp4"
	"$VIDEO_DIR/video1.mp4"
)

for video in "${videos[@]}"; do
	if [[ ! -f "$video" ]]; then
		echo "Video not found: $video" >&2
		exit 1
	fi
done

exec mpv --fs --loop-playlist=inf --no-osd-bar --gpu-api=opengl "${videos[@]}"
