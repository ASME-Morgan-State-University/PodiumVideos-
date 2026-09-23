# PodiumVideos-
The pi400 Setup That Plays videos

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
Terminal=false
EOF
```

Restart the Pi or log out and back in. The desktop session will play `video0.mp4`,
then `video1.mp4`, fullscreen, and repeat that sequence continuously.
