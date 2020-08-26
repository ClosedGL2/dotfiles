" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if !exists('g:vscode')
  call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  call plug#end()
endif
