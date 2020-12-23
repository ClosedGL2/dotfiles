" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" plug in
call plug#begin()

Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
Plug 'tpope/vim-fugitive'

call plug#end()

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERDTree Git
let g:NERDTreeGitStatusConcealBrackets = 1

" color scheme
set termguicolors
colorscheme daycula

" Airline
source $HOME/.config/nvim/themes/airline.vim
