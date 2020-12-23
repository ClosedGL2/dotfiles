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

imap <A-h> <Esc>i
imap <A-j> <Esc>ja
imap <A-k> <Esc>ka
imap <A-l> <Esc>la

nmap <A-n> :set nu!<CR>
nmap <A-r> :set rnu!<CR>

nmap <C-c> :nohlsearch<CR>

nmap <A-d> :NERDTreeToggle<CR>
nmap <A-D> :NERDTreeFocus<CR>

imap jk <Esc>
vmap jk <Esc>

tmap <A-j><A-k> <C-\><C-n>

" macros
let @i='iO	'   " line Inside
let @a='ggVG'       " select All
let @e='ggVGx'      " Erase buffer

function InsertMacro(print)
    let @q='i""'      " Quotes
    let @p='i()'      " Parentheses
    let @b='i[]'      " Brackets
    let @c='i{}'      " Curly brackets
    if a:print
        echo '@q, @p, @b, @c macros will now insert'
    endif
endfunction

function AppendMacro(print)
    let @q='a""'      " Quotes
    let @p='a()'      " Parentheses
    let @b='a[]'      " Brackets
    let @c='a{}'      " Curly brackets
    if a:print
        echo '@q, @p, @b, @c macros will now append'
    endif
endfunction

function CppMacro(print) " C++ macros
    let @l='i#include <>i'            " include Library (C++)
    let @o='ocout << "" << endl;3bli' " Output text (C++)
    let @m='iint main(){}iO	'   " Main function (C++)
    let @n='iusing namespace ;i' " Namespace (C++)
    if a:print
        echo 'C++ macros set'
    endif
endfunction

function PyMacro(print) " Python macros
    let @h='iprint("Hello world")' " Hello world program (Python)
    let @l='iimport '       " import Library (Python)
    let @o='oprint("")hi' " Output text (Python)
    if a:print
        echo 'Python macros set'
    endif
endfunction

" default macros
call InsertMacro(0)
call CppMacro(0)

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
command Im call InsertMacro(1)
command Am call AppendMacro(1)
command Cm call CppMacro(1)
command Pm call PyMacro(1)

" Neovim plugins
source ~/.config/nvim/vim-plug/plugins.vim
