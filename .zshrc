setopt nocheckjobs
setopt correct
setopt nobeep
setopt appendhistory
setopt autocd

# prompt
autoload -U colors && colors
PS1="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b "

# tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# history file
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias l='ls -al'
alias makewords="tr -d '[:punct:]' | xargs | tr ' ' '\n'"
alias lowercase="tr '[A-Z]' '[a-z]'"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# change cursor shape for vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}
