# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Enable completion and syntax highlighting (ovisno kako ih instaliraš na sustavu)
autoload -Uz compinit && compinit

# Smart past searches lookup
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Box cursor
_set_box_cursor() {
    print -n '\e[2 q'
}
precmd_functions+=(_set_box_cursor)
zle-line-init() {
    _set_box_cursor
}
zle -N zle-line-init

# Aliases
alias ls="eza --group-directories-first"
alias ll="eza -l -g --icons --git --group-directories-first"
alias la="eza -la -g --icons --git --group-directories-first"
alias lt="eza --tree --level=2 --icons --group-directories-first"
