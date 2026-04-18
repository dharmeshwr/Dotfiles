# zmodload zsh/zprof 
function dev() {
    local session_name=$(basename "$PWD")
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        tmux new-session -d -s "$session_name" -n 'nvim'
        tmux send-keys -t "$session_name:nvim" 'nvim' C-m
        tmux new-window -t "$session_name" -n 'server'
        tmux send-keys -t "$session_name:server" 'pnpm dev' C-m
        tmux select-window -t "$session_name:nvim"
        tmux attach-session -t "$session_name"
    fi
}

function gacp() {
    if [[ $# -ne 1 ]]; then
        echo "Error: Commit message is required."
        return 1
    fi
    local msg=$1
    git add --all
    if git diff --cached --quiet; then
        echo "No changes to commit."
        return 1
    fi
    echo "==== Staged Files ===="
    local staged=(${(f)"$(git diff --name-only --cached)"})
    if [[ ${#staged[@]} -eq 0 ]]; then
        echo "(none)"
    else
        for file in "${staged[@]}"; do
            echo "$file"
        done
    fi
    git commit -m "$msg" && git push
}

function restart() {
    if [[ $# -ne 1 ]]; then
        echo "Error: process name required"
        return 1
    fi
    local process=$1
    pkill "$process"
    "$process" &!
}
# eval "$(starship init zsh)"
# eval "$(zoxide init --cmd cd zsh)"

export ZSH="$HOME/.oh-my-zsh"
# export SSH_AUTH_SOCK=/run/user/$UID/keyring/ssh
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$PNPM_HOME:$BUN_INSTALL/bin:$PATH"
# export GTK_PATH="/usr/include/gtk3.0"
# export XDG_CACHE_HOME=/home/ninjafire/.cache
# export XAUTHORITY=/home/ninjafire/.Xauthority
export EDITOR='/usr/local/bin/nvim'
# export GTK_THEME=Tokyonight-Dark
export LANG=en_US.UTF-8
# export MICRO_TRUECOLOR=1
# export GDK_BACKEND=x11
# export GTK_USE_PORTAL=0
# export DISPLAY=:0

HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy"

ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    # you-should-use
    auto-notify
)

source $ZSH/oh-my-zsh.sh
[ -s "/home/ninjafire/.bun/_bun" ] && source "/home/ninjafire/.bun/_bun"

alias ..='cd ..'
alias ....='cd ../..'
alias dots='cd ~/Dotfiles'
alias conf='cd ~/.config'

alias nv='nvim'
alias vn="sudo nvim"
alias zconf="nvim ~/.zshrc"
alias clearvim='rm ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim'

alias vv="bat --theme='gruvbox-dark' ~/Workspace/notes/.todo.md"
alias ee="nvim ~/Workspace/notes/.todo.md"
alias aa="bat >> ~/Workspace/notes/.todo.md"

alias ls='eza --grid --color auto --icons --sort=type'
alias ll='eza --long --color always --icons --sort=type'
alias la='eza --grid --all --color auto --icons --sort=type'
alias lla='eza --long --all --color auto --icons --sort=type'

# alias cache='paru -Scc'
# alias orphan='paru -Rns $(pacman -Qtdq)'
# alias mirrors='sudo reflector --verbose --sort rate -l 30 --save /etc/pacman.d/mirrorlist'

alias rm='rm -vrf'
alias cp='cp -rv'
# alias ts='tesseract'
# alias df='duf'
alias lol='lolcat'
alias lg='lazygit'
alias cost='scc'
alias du='du -shc'
alias secret='openssl rand -hex 32'
# alias pu='sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su'

# alias waves='sudo systemctl restart hotspot.service'
# alias stop='sudo systemctl stop hotspot.service'
#
# alias rebuild='sudo make clean install'
# alias patch='patch -p1 < '

# zprof

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
