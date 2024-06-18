# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="steeef"

export EDITOR='nvim'

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
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='nvim'
# else
#    export EDITOR='nvim'


# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ..='cd ..'
alias ....='cd ../..'
alias zshconf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias nv='nvim'
alias uncommit="reset HEAD~1"
alias recommit="commit --amend --no-edit"
alias editcommit="commit --amend"
alias df='cd ../frontend'
alias db='cd ../backend'
alias push='git push origin master && git push intern master'
alias qconf='cd ~/.config/qtile && nvim'
alias reload='qtile cmd-obj -o cmd -f reload_config'
alias vv="cat ~/work/task.txt"
alias ee="nvim ~/work/task.txt"
alias aa="cat >> ~/work/task.txt"
alias starship="nvim  ~/.config/starship.toml"
alias nv="nvim"
alias ls='exa --grid --color auto --icons --sort=type'
alias ll='exa --long --color always --icons --sort=type'
alias la='exa --grid --all --color auto --icons --sort=type'
alias lla='exa --long --all --color auto --icons --sort=type'
alias zel='zellij a didactic-ukulele'

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
