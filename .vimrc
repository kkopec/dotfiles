"PREFERENCES
set nocompatible
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=80
set cursorline
set hlsearch
set incsearch
set joinspaces
set laststatus=2
set mouse=a
set noshowmode
set nobackup nowritebackup noswapfile
set number
set showcmd
set showmatch
set splitbelow
set splitright
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set ww+=<,> "moving through line breaks

"PLUGINS
call plug#begin('~/.vim/plugged')
 "UTILS
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'Yggdroot/indentLine'
    Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
    Plug 'chrisbra/Colorizer', { 'on': 'ColorToggle' }

 "APPEARANCE
    Plug 'itchyny/lightline.vim'
    Plug 'blueshirts/darcula'

 "GIT
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

 "LANGUAGES
  "Python
    Plug 'python-mode/python-mode', { 'for': 'python' }
  "Javascript
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  "Typescript
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  "Rust
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()

"PLUGINS SETTINGS
  "vim-javascript
    let g:javascript_plugin_jsdoc = 1


"CUSTOM MAPPINGS
let mapleader=","

map <F4> :NERDTreeToggle<CR>
map <F5> :source ~/.vimrc<CR>
map <F9> :ColorToggle<CR>

cmap w!! w !sudo tee > /dev/null %

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
nnoremap <leader>n :set relativenumber!<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

