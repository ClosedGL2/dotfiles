setopt nocheckjobs
setopt correct
setopt nobeep
setopt appendhistory
setopt autocd
setopt prompt_subst

# prompt
autoload -U colors && colors
NEWLINE=$'\n'

precmd () {
	VI_MODE="%B%F{46}I%b"
	PS1="%F{46}[%B%F{9}%n%F{21}%b@%B%F{184}%M%f %b%F{172}%1~%F{46}]${NEWLINE}${VI_MODE}%f %F{200}>%f "
}

function set-prompt () {
	case ${KEYMAP} in
		(vicmd)			VI_MODE="%B%F{51}N%b" ;;
		(main|viins)	VI_MODE="%B%F{46}I%b" ;;
		(*)				VI_MODE="%B%F{46}I%b" ;;
	esac
	PS1="%F{46}[%B%F{9}%n%F{21}%b@%B%F{184}%M%f %b%F{172}%1~%F{46}]${NEWLINE}${VI_MODE}%f %F{200}>%f "
}

function zle-line-init zle-keymap-select {
	set-prompt
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

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
alias gimme="paru -S"
alias lookfor="paru -Ss"
alias yeet="paru -Rcn"
alias update="paru -Syu"
alias homeworkfolder="rm -rf ~/Homework && git clone https://github.com/ClosedGL2/dotfiles ~/Homework"
alias listcfiles="echo \$(find . -name '*.h' && find . -name '*.c' && find . -name '*.hpp' && find . -name '*.cpp') | tr ' ' '\n' | sort"
alias viewfiles="xargs -n 1 less"
alias zshrc="$EDITOR ~/.zshrc"

# dmenu config
alias dmenu="dmenu -nf '#C5C5C5' -nb '#3B3B3B' -sb '#3670BB' -sf '#FFFFFF' -fn 'monospace-10'"
alias dmenu_run="dmenu_run -nf '#C5C5C5' -nb '#3B3B3B' -sb '#3670BB' -sf '#FFFFFF' -fn 'monospace-10' -p 'Run command:'"

# vi mode
bindkey -v
KEYTIMEOUT=1
