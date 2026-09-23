# PodiumVideos-
The pi400 Setup That Plays videos

## Setting up the Video Stand
Just Plug it in. Make sure it has wifi if you are expecting new videos.

## Raspberry Pi setup

This setup expects the project and video to be located at:

```text
/home/asmeehpv/PodiumVideos-/start.bash
/home/asmeehpv/PodiumVideos-/video0.mp4
/home/asmeehpv/PodiumVideos-/video1.mp4
```

Install `mpv`, make the startup script executable, and create a desktop
autostart entry:

```bash
sudo apt update
sudo apt install -y mpv
chmod +x /home/asmeehpv/PodiumVideos-/start.bash

mkdir -p /home/asmeehpv/.config/autostart
cat > /home/asmeehpv/.config/autostart/podium-videos.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Podium Videos
Exec=/home/asmeehpv/PodiumVideos-/start.bash
Terminal=true
EOF
```

Restart the Pi or log out and back in. The terminal window will show the Git
update and startup stages, then the desktop session will play all video files
fullscreen in filename order and repeat them continuously. Add new videos to
`/home/asmeehpv/PodiumVideos-` and they will be included after the next Git pull.
