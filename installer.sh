#!/bin/bash
paru -S thunar blueberry-tray polkit-kde-agent xfce4-power-manager blueman-applet volumeicon xserver-xephyr xfce4-notifyd pavucontrol neofetch cava timeshift intel-media-driver libvdpau-va-gl libva-nvidia-driver xdg-desktop-portal org.freedesktop.secrets rtkit qt6-shadertools xorg-xwayland qrencode preload zsh curl xclip ripgrep fd bar lsd meson ninja qt6-quickcontrols qtdeclarative5-private-dev qt5-graphicaleffects qt5-quickcontrols ufw  gvfs udisks2 pyside6 pyqt6 qt5-quickcontrols2 qt5-graphicaleffects qt6-5compact ttf-unifont

sudo systemctl enable udisks2
sudo systemctl start udisks2
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw allow ssh
timedatectl set-timezone Asia/Kolkata
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
