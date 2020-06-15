" Vim settings
set nu
set rnu
syntax on
colorscheme default
set bg=dark
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set ruler
set noerrorbells
set showmode
set incsearch
set ignorecase
set history=1000
set wildmenu
set wrap
set laststatus=2

" plugins
call plug#begin()
call plug#end()

" key bindings
nnoremap B ^
nnoremap E $
map <C-H> ^
map <C-J> <C-D>
map <C-K> <C-U>
map <C-L> $

" command case fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Wq wq
cmap Q q
cmap Q! q!
cmap q1 q!
cmap Q1 q!

" custom commands
cmap code e ~/Documents/Coding/
cmap settings e ~/.vimrc
cmap i3config e ~/.config/i3/config
cmap alacrittyconfig e ~/.config/alacritty/alacritty.yml
