starship init fish | source

set fish_greeting ""

set -gx TERM xterm-256color

abbr clip "xsel --clipboard"

alias nv 'nvim'
alias clearvim 'rm ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim'

alias vv "bat --theme='gruvbox-dark' ~/Workspace/.todo.md"
alias ee "nvim ~/Workspace/.todo.md"
alias aa "bat >> ~/Workspace/.todo.md"

alias ls 'eza --grid --color auto --icons --sort=type'
alias ll 'eza --long --color always --icons --sort=type'
alias la 'eza --grid --all --color auto --icons --sort=type'
alias ll 'eza --long --all --color auto --icons --sort=type'

alias rm 'rm -vrf'
alias cp 'cp -rv'
alias ts 'tesseract'
# alias df='duf'
alias cost 'scc'
alias du 'du -shc'
alias secret 'openssl rand -hex 32'

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set -gx PATH node_modules/.bin $PATH
