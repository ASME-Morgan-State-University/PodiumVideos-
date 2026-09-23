#!/usr/bin/env bash

# Play the configured video fullscreen. Add this script to the desktop
# environment's startup applications to run it automatically on boot.
set -euo pipefail


VIDEO_DIR="/home/asmeehpv/PodiumVideos-"

echo "[1/3] Updating videos from Git..."
cd "$VIDEO_DIR"
if ! git pull --ff-only; then
	echo "Git update failed. Videos will not start." >&2
	read -r -p "Press Enter to close this window..." || true
	exit 1
fi
echo "Git update complete."

echo "[2/3] Finding videos..."
mapfile -d '' videos < <(find "$VIDEO_DIR" -maxdepth 1 -type f \( \
	-iname '*.mp4' -o -iname '*.mkv' -o -iname '*.webm' -o -iname '*.avi' \
	-o -iname '*.mov' -o -iname '*.m4v' \
\) -print0 | sort -z -V)

if [[ ${#videos[@]} -eq 0 ]]; then
	echo "No videos found in $VIDEO_DIR" >&2
	read -r -p "Press Enter to close this window..." || true
	exit 1
fi

echo "[3/3] Starting ${#videos[@]} video(s) in a loop..."
exec mpv --fs --loop-playlist=inf --no-osd-bar --gpu-api=opengl "${videos[@]}"
