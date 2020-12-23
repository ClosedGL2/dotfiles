setopt nocheckjobs
setopt correct
setopt nobeep
setopt appendhistory
setopt autocd

# prompt
autoload -U colors && colors
NEWLINE=$'\n'
PS1="%F{46}[%F{9}%n%F{21}@%F{184}%M %F{172}%1~%F{46}]${NEWLINE}%F{45}%#> "

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
alias edit=$EDITOR

# history file
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias l='ls -al'
alias c='clear'
alias makewords="tr -d '[:punct:]' | xargs | tr ' ' '\n'"
alias lowercase="tr '[A-Z]' '[a-z]'"
alias please="doas"
alias gimme="yay -S"
alias lookfor="yay -Ss"
alias yeet="yay -R"
alias update="yay"
alias homeworkfolder="rm -rf ~/Homework && git clone https://github.com/ClosedGL2/dotfiles ~/Homework"
alias listcfiles="echo \$(find . -name '*.h' && find . -name '*.c' && find . -name '*.hpp' && find . -name '*.cpp') | tr ' ' '\n' | sort"
alias viewfiles="xargs -n 1 less"
alias zshrc="$EDITOR ~/.zshrc"

# dmenu config
alias dmenu="dmenu -nf '#C5C5C5' -nb '#3B3B3B' -sb '#3670BB' -sf '#FFFFFF' -fn 'monospace-10'"
alias dmenu_run="dmenu_run -nf '#C5C5C5' -nb '#3B3B3B' -sb '#3670BB' -sf '#FFFFFF' -fn 'monospace-10' -p 'Run command:'"

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
