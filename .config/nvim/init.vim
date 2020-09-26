" Vim settings
set nu
set rnu
syntax on
colorscheme default
set bg=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ruler
set noerrorbells
set showmode
set incsearch
set ignorecase
set history=1000
set wildmenu
set wrap
set laststatus=2
set lazyredraw

" key bindings
inoremap <A-j> <Esc>@
vnoremap <A-j> <Esc>@
map <A-j> <Esc>@
map <C-H> ^
map <C-J> <C-D>
map <C-K> <C-U>
map <C-L> $
map <C-O> o<Esc>

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
cmap W w
cmap WQ wq
cmap wQ wq
cmap Wq wq
cmap Q q
cmap Q! q!
cmap q1 q!
cmap Q1 q!

" custom commands
command Code e ~/Dropbox/Coding/
command Settings e ~/.config/nvim/init.vim
command Pluginsconfig e ~/.config/nvim/vim-plug/plugins.vim
command Im call InsertMacro(1)
command Am call AppendMacro(1)
command Cm call CppMacro(1)
command Pm call PyMacro(1)
command Nf e! a

" Neovim plugins
source ~/.config/nvim/vim-plug/plugins.vim
