" keep current color settings
syntax enable

set nocompatible
set shell=/bin/bash

" Vundle configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" All plugins to be added AFTER  this line


" Better python intendation management
Plugin 'vim-scripts/indentpython.vim'

" Python Auto-complete engine
Plugin 'davidhalter/jedi-vim'

" Enable javascript syntax highlighting and intenting.
Plugin 'pangloss/vim-javascript'

" Syntax checking on save
Plugin 'scrooloose/syntastic'

" [PYTHON] PEP8 checking
Plugin 'nvie/vim-flake8'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" File Browsing
Plugin 'scrooloose/nerdtree'

" Tabs and NERDTree
Plugin 'jistr/vim-nerdtree-tabs'

" Supersearch from VIM
Plugin 'kien/ctrlp.vim'

" Enhanced status bar
Plugin 'bling/vim-airline'

" Show file diff in the gutter
Plugin 'airblade/vim-gitgutter'


" All plugins to be added BEFORE this line
call vundle#end()
filetype plugin indent on

" Solarized color scheme settings
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Do not create swp file - use GIT
set nobackup
set nowritebackup
set noswapfile

" Split Below/Right
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Turn on line number
set nu

" Always show status line
set laststatus=2

" Work with UTF-8
set encoding=utf-8

" Set GitGutter update time to 1 sec
set updatetime=1000

" Force to home-row
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>  <NOP>

" NERDTree ignore
let NERDTreeIgnore=['\.pyc$', '\~$']

if v:version >= 703
  set colorcolumn=80
endif
set tabstop=2      " a hard TAB displays as 2 columns
set softtabstop=2  " insert/delete 2 spaces when hitting a TAB/BACKSPACE
set shiftwidth=2   " operation >> indents 2 columns; << unindents 2 columns
set expandtab      " insert spaces when hitting TABs
set shiftround     " round indent to multiple of 'shiftwidth'
set autoindent     " align the new line indent with the previous line

" [PYTHON] PEP8
au FileType python setl ts=4 sts=4 sw=4 et ai ff=unix

" [PYTHON] virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" [PYTHON] Better highliting
autocmd BufRead,BufNewFile *.py let python_highlight_all=1

