#!/bin/bash

# Function to prompt for confirmation
confirm() {
  read -r -p "${1} [y/N] " response
  case "$response" in
  [yY][eE][sS] | [yY])
    true
    ;;
  *)
    false
    ;;
  esac
}

# Function for double confirmation
double_confirm() {
  if confirm "${1}"; then
    if confirm "Are you absolutely sure? This cannot be undone!"; then
      return 0
    fi
  fi
  return 1
}

# Error handling
set -e
trap 'echo "Error occurred at line $LINENO. Command: $BASH_COMMAND"' ERR

echo "🚀 Starting Arch Linux setup script..."

# Dangerous operation - remove home directories
if confirm "⚠️  WARNING: This will delete your home directories (Desktop, Documents, etc). Continue?"; then
  rm -rf ~/Desktop/ ~/Documents/ ~/Music/ ~/Public/ ~/Templates/ ~/Videos/
  echo "✔️  Home directories removed"
fi

# Install base packages
echo "📦 Installing base packages..."
sudo pacman -S --noconfirm micro neovim btop || {
  echo "❌ Failed to install base packages"
  exit 1
}

# Install base-devel
echo "🛠️  Installing development tools..."
sudo pacman -S --needed --noconfirm base-devel || {
  echo "❌ Failed to install base-devel"
  exit 1
}

# Install paru
if ! command -v paru &>/dev/null; then
  echo "📥 Installing paru AUR helper..."
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd ..
  rm -rf ~/paru
fi

# System update
echo "🔄 Updating system..."
paru -Syyu --noconfirm

# Install X11 and related packages
echo "🖥️  Installing X11 packages..."
paru -S --noconfirm picom xsel xclip xorg-apps openssh

# Install suckless tools
if confirm "Do you want to install suckless tools (dwm, dmenu, etc)?"; then
  echo "🔧 Installing suckless tools..."
  git clone https://github.com/dharmesh53/dotfiles.git
  cp -r dotfiles/suckless/ ~/

  for tool in dmenu dwm slstatus st slock; do
    cd ~/suckless/$tool
    sudo make install
  done
fi

# Copy config files
echo "📋 Copying configuration files..."
cp ~/dotfiles/.xinitrc ~/dotfiles/.Xmodmap ~

# Install fonts
echo "🔤 Installing fonts..."
paru -S --noconfirm ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-unifont ttf-dejavu-nerd ttf-dejavu ttf-joypixels ttf-font-awesome

# Install development tools
echo "💻 Installing development tools..."
paru -S --noconfirm nodejs npm pnpm code mongodb-compass obsidian

# Install and configure zsh
if confirm "Do you want to install and configure zsh?"; then
  echo "🐚 Setting up zsh..."
  paru -S --noconfirm zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  paru -S --noconfirm zoxide eza
  curl -sS https://starship.rs/install.sh | sh
  cp ~/dotfiles/.zshrc ~
fi

# Install theme-related packages
echo "🎨 Installing theme packages..."
paru -S --noconfirm unzip qt5ct lxappearance tree xdotool
mkdir -p ~/.themes ~/.icons
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment

# Setup display manager
echo "🖥️  Setting up display manager..."
sudo cp ~/dotfiles/dwm.desktop /usr/share/xsessions/

# Copy configurations
echo "⚙️  Copying configurations..."
mkdir -p ~/.config
cp -r ~/dotfiles/config/nvim ~/.config/
cp -r ~/dotfiles/config/picom ~/.config/
mkdir -p ~/.local/bin
cp -r ~/dotfiles/config/bin ~/.local/

# Setup LightDM
if confirm "Do you want to setup LightDM?"; then
  echo "🔑 Setting up LightDM..."
  paru -S --noconfirm figlet lightdm-gtk-greeter accountsservice bat gnome-keyring
  # cp ~/dotfiles/profile.jpg ~/.face
  # chmod 644 ~/.face
  # sudo systemctl enable accounts-daemon
  # sudo systemctl start accounts-daemon
  # sudo chmod 755 /var/lib/AccountsService/users
  # sudo chmod 755 /var/lib/AccountsService/icons
  sudo cp -r ~/dotfiles/lightdm/* /etc/lightdm/
  sudo mkdir -p /usr/share/backgrounds /usr/share/themes
  sudo cp ~/dotfiles/wallpaper.jpg /usr/share/backgrounds/01.jpg
fi

# Setup VS Code
if confirm "Do you want to configure VS Code?"; then
  echo "📝 Configuring VS Code..."
  mkdir -p ~/.config/Code\ -\ OSS/User/
  cp ~/dotfiles/settings.json ~/.config/Code\ -\ OSS/User/
  cp ~/dotfiles/keybindings.json ~/.config/Code\ -\ OSS/User/
fi

# Setup Plymouth
if confirm "Do you want to setup Plymouth boot splash?"; then
  echo "🎨 Setting up Plymouth..."
  paru -S --noconfirm plymouth plymouth-theme-minimal-dark-git
  sudo plymouth-set-default-theme -R minimal-dark
  sudo dracut --force
  echo "⚠️  Remember to add 'quiet splash vt.global_cursor_default=0' to your kernel parameters"
fi

# Setup Bluetooth
if confirm "Do you want to setup Bluetooth?"; then
  echo "📶 Setting up Bluetooth..."
  paru -S --noconfirm blueman bluez bluez-utils
  sudo systemctl enable bluetooth
  sudo systemctl start bluetooth
fi

# Generate locale
echo "🌍 Generating locale..."
# sudo locale-gen

# Setup Git and SSH
if confirm "Do you want to setup Git and SSH?"; then
  echo "🔑 Setting up Git and SSH..."
  cp ~/dotfiles/.gitconfig ~/.gitconfig

  read -p "Enter your email for SSH key: " email
  ssh-keygen -t ed25519 -C "$email"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  # Setup pass
  paru -S --noconfirm pass
  gpg --generate-key
  echo "Please manually add the  generated key to pass using 'pass init KEY'"
  # pass init "$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2 | cut -d' ' -f1)"
fi

# Install additional utilities
echo "🔧 Installing additional utilities..."
paru -S --noconfirm tmux cava fastfetch preload udisks2 ufw
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/dotfiles/.tmux.conf ~

# Enable services
echo "🔄 Enabling services..."
sudo systemctl enable udisks2
sudo systemctl start udisks2
sudo systemctl enable ufw.service
sudo systemctl start ufw.service
sudo ufw allow ssh

echo "✅ Setup complete! Please reboot your system for all changes to take effect."
