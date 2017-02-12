"PREFERENCES
set nocompatible
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cursorline
set incsearch
set joinspaces
set laststatus=2
set mouse=a
set noshowmode
set nobackup nowritebackup noswapfile
set number
set showcmd
set showmatch
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set ww+=<,> "moving through line breaks

"PLUGINS
call plug#begin('~/.vim/plugged')
 "UTILS
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
 
 "APPEARANCE
    Plug 'itchyny/lightline.vim'
  "colorschemes
    Plug 'blueshirts/darcula'

 "GIT
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

 "LANGUAGES
  "Python
    Plug 'python-mode/python-mode', { 'for': 'python' }
  "Javascript
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
call plug#end()


"CUSTOM MAPPINGS
let mapleader="," " change leader from '\'
map <F4> :NERDTreeToggle<CR>


"APPEARANCE
    if !has('gui_running')
        set t_Co=256
    endif

    "colorscheme
    colorscheme darcula
    let g:lightline = {
        \ 'colorscheme': 'darcula'
        \ }

    "transparency
    "highlight Normal ctermbg=none
    "highlight NonText ctermbg=none

