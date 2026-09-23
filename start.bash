#!/usr/bin/env bash

# Play the configured video fullscreen. Add this script to the desktop
# environment's startup applications to run it automatically on boot.
set -euo pipefail


VIDEO_DIR="/home/asmeehpv/PodiumVideos-"

echo "[1/4] Waiting for Wi-Fi and network..."
while ! getent hosts github.com >/dev/null 2>&1; do
	printf "."
	sleep 2
done
echo
echo "Network is ready."

echo "[2/4] Updating videos from Git..."
cd "$VIDEO_DIR"
if ! git pull --ff-only; then
	echo "Git update failed. Continuing with local videos." >&2
else
	echo "Git update complete."
fi

echo "[3/4] Finding videos..."
mapfile -d '' videos < <(find "$VIDEO_DIR" -maxdepth 1 -type f \( \
	-iname '*.mp4' -o -iname '*.mkv' -o -iname '*.webm' -o -iname '*.avi' \
	-o -iname '*.mov' -o -iname '*.m4v' \
\) -print0 | sort -z -V)

if [[ ${#videos[@]} -eq 0 ]]; then
	echo "No videos found in $VIDEO_DIR" >&2
	read -r -p "Press Enter to close this window..." || true
	exit 1
fi

echo "[4/4] Starting ${#videos[@]} video(s) in a loop..."
exec mpv --fs --loop-playlist=inf --no-osd-bar --gpu-api=opengl "${videos[@]}"
