# PodiumVideos-
The pi400 Setup That Plays videos

## Raspberry Pi setup

This setup expects the project and video to be located at:

```text
/home/pi/PodiumVideos-/start.bash
/home/pi/PodiumVideos-/video0.mp4
```

Install `mpv`, make the startup script executable, and create a desktop
autostart entry:

```bash
sudo apt update
sudo apt install -y mpv
chmod +x /home/pi/PodiumVideos-/start.bash

mkdir -p /home/pi/.config/autostart
cat > /home/pi/.config/autostart/podium-videos.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=Podium Videos
Exec=/home/pi/PodiumVideos-/start.bash
Terminal=false
EOF
```

Restart the Pi or log out and back in. The desktop session will start `video0.mp4`
fullscreen and loop it continuously.
