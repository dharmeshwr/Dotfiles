# if test (tty) = "/dev/tty1"
#     exec /bin/sh
# end

# sudo rm -rf /opt/Discord/ && sudo rm -rf /usr/bin/discord
# tar -xvf discord-0.0.110.tar.gz
# sudo cp -r Discord/ /opt
# rm -rf ~/Downloads/Discord ~/Downloads/*.tar.gz
# sudo ln -sf /opt/Discord/Discord /usr/bin/discord

starship init fish | source

set fish_greeting ""

set -gx TERM xterm-256color

abbr present "sudo chronyc -a makestep"
abbr clip "xsel --clipboard"

abbr nv 'nvim'
alias clearvim 'rm ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim'

abbr xi 'sudo xbps-install -Svu'
abbr xr 'sudo xbps-remove -ROov'
abbr xq 'sudo xbps-query'

alias lg "lazygit"

alias vv "bat --theme='gruvbox-dark' ~/Workspace/.todo.md"
alias ee "nvim ~/Workspace/.todo.md"
alias aa "bat >> ~/Workspace/.todo.md"

alias ls 'eza --grid --color auto --icons --sort=type'
alias ll 'eza --long --color always --icons --sort=type'
alias la 'eza --grid --all --color auto --icons --sort=type'
alias ll 'eza --long --all --color auto --icons --sort=type'

alias fconf 'nvim ~/.config/fish/config.fish'
alias rm 'rm -vrf'
alias cp 'cp -rv'
alias ts 'tesseract'
alias ff 'fastfetch'
alias cost 'scc'
alias du 'du -shc'
alias secret 'openssl rand -hex 32'

set -gx EDITOR nvim
set -gx TERMINAL st

set --export ANDROID_HOME $HOME/Android/Sdk

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin/ $PATH
set -gx PATH ~/.local/bin/statusbar/ $PATH
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH

set -gx PATH node_modules/.bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
