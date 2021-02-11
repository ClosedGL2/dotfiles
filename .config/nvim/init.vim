" Vim settings
set nu
set rnu
syntax on
set bg=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set noerrorbells
set showmode
set incsearch
set ignorecase
set history=1000
set wildmenu
set wrap
set laststatus=2
set timeoutlen=100
set cursorline
set colorcolumn=80

" key bindings
inoremap <A-m> <Esc>@
vnoremap <A-m> <Esc>@
map <A-m> <Esc>@

nmap <A-t> :terminal<CR>:set nu!<CR>:set rnu!<CR>Gi

nmap <C-H> :tabprevious<CR>
nmap <C-J> <C-D>
vmap <C-J> <C-D>
nmap <C-K> <C-U>
vmap <C-K> <C-U>
nmap <C-L> :tabnext<CR>

imap <C-J> <Esc><C-D>a
imap <C-K> <Esc><C-U>a

nmap <A-h> <C-W>h
nmap <A-j> <C-W>j
nmap <A-k> <C-W>k
nmap <A-l> <C-W>l

nmap <A-H> <C-W>5<
nmap <A-J> <C-W>2+
nmap <A-K> <C-W>2-
nmap <A-L> <C-W>5>

imap <A-h> <Left>
imap <A-j> <Down>
imap <A-k> <Up>
imap <A-l> <Right>

nmap <A-n> :set nu!<CR>
nmap <A-r> :set rnu!<CR>

nmap <C-s> :nohlsearch<CR>

vmap <C-c> "+y
nmap <C-c> "+yy
nmap <C-p> "+P

nmap <A-d> :NERDTreeToggle<CR>
nmap <A-D> :NERDTreeFocus<CR>

imap jk <Esc>
vmap jk <Esc>

tmap <A-j><A-k> <C-\><C-n>

" command case fixes
cmap WQ wq
cmap wQ wq
cmap Wq wq
cmap Q! q!
cmap q1 q!
cmap Q1 q!

" custom commands
command Settings e ~/.config/nvim/init.vim
command Pluginsconfig e ~/.config/nvim/vim-plug/plugins.vim

" Neovim plugins
source ~/.config/nvim/vim-plug/plugins.vim
