#!/bin/bash

printf "✨ Hello Everynyan! ✨ Let's sprinkle some suckless software onto your machine! 🌈\n" | lolcat
cowsay -f hellokitty "Choose your theme, nya~! (✿◕‿◕)" | lolcat
  
cat <<< "
 1. Gruvbox-Dark 🎨
 2. Gruvbox-Light 🎨
 3. Catppuccin 🍮
 4. Solarized
" | lolcat

read -p "Enter your choice (1/2/3/4): " choice

install-dependencies() {
  if [[ $1 != "y" ]]; then
    printf "Installing required dependencies... 🛠️ \n" | lolcat
    sudo pacman -S --noconfirm base-devel xsel xclip xorg-apps 
    printf "Dependencies installed! 🎉 \n" | lolcat
  fi
}

install-theme() {
  read -p "Do you have dependencies installed? [Y/n]: " installed
  install-dependencies "$installed"

  local theme_name="$2"
  local theme_dir="$1"

  printf "Installing the $theme_name theme... 🌟 \n" | lolcat

  for subdir in $theme_dir/*; do
    printf "Installing $(basename $subdir) 🛠️ \n" | lolcat
    (cd $subdir && sudo make clean install)
    if [[ $? -ne 0 ]]; then
      printf "Oopsie! Something went wrong with $subdir. 😿 Check your password and permissions! \n" | lolcat
    else
      printf "$(basename $subdir) installed successfully! 🎉 \n\n" | lolcat
    fi
  done
}

case $choice in
  1)
    install-theme "gruvbox-dark-suckless" "Gruvbox-Dark"
    ;;
  2)
    install-theme "gruvbox-light-suckless" "Gruvbox-Light"
    ;;
  3)
    install-theme "catppuccin-suckless" "Catppuccin"
    ;;
  4)
    install-theme "solarized-suckless" "Solarized"
    ;;
  *)
    printf "Invalid option! Try again, nya~! 😺 \n" | lolcat
    ;;
esac

printf "Creating DWM desktop entry... 🖥️ \n\n" | lolcat

mkdir -p /usr/share/xsessions
sudo cp dwm.desktop /usr/share/xsessions/

cowsay -f hellokitty "All done! You're good to go, nya~! 🌸 " | lolcat
