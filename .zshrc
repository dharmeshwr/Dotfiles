# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

export EDITOR='nvim'

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# zstyle ':omz:update' frequency 13

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    git
    docker
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='nvim'
# else
#    export EDITOR='nvim'


alias ..='cd ..'
alias ....='cd ../..'
alias zshconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias nv='nvim'
alias vn="sudo nvim"
alias uncommit="git reset HEAD~1"
alias recommit="git commit --amend --no-edit"
alias editcommit="git commit --amend"
alias df='cd ../frontend'
alias db='cd ../backend'
alias vv="cat ~/work/Tasks/task.txt"
alias ee="nvim ~/work/Tasks/task.txt"
alias aa="cat >> ~/work/Tasks/task.txt"
alias starship="nvim  ~/.config/starship.toml"
# alias ls='lsd'
# alias la='lsd -a'
alias ls='exa --grid --color auto --icons --sort=type'
alias ll='exa --long --color always --icons --sort=type'
alias la='exa --grid --all --color auto --icons --sort=type'
alias lla='exa --long --all --color auto --icons --sort=type'
alias daddy='sudo'
alias gf='onefetch'
alias rm='rm -vrf'
alias syt='python ~/work/Tasks/htmlToTxt.py'
alias syh='python ~/work/Tasks/txtToHtml.py'
alias cache='paru -Scc'
alias orphan='paru -Rns $(pacman -Qtdq)'
alias ts='tesseract'
alias df='duf'
alias clearVim='rm ~/.local/state/nvim ~/.local/share/nvim ~/.cache/nvim'
alias lol='lolcat'
alias cost='scc'
alias hotspot='sudo systemctl restart hotspot.service'
alias stop='sudo systemctl stop hotspot.service'
alias du='du -shc'
alias secert='openssl rand -hex 32'

export SSH_AUTH_SOCK=/run/user/$UID/keyring/ssh
export PATH="/home/ninjafire/.local/bin:$PATH"
export BOOST_ROOT="/usr/include/boost"
export GTK_PATH="/usr/include/gtk3.0"
# export GTK_THEME=Gruvbox-Dark-BL-LB
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
