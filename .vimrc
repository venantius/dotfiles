" Venantius' .vimrc

autocmd!

"""""""""""""""""""""""""""
" CORE EDITING SETTINGS
"""""""""""""""""""""""""""

set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set backspace=indent,eol,start

" Added from Gary Bernhart's .vimrc
" May not keep these indefinitely
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set winwidth=79
" Suspect, but GB claims necessary for RVM
set shell=bash
set scrolloff=3
set showcmd
" Should look into WildMode some more. Seems pretty handy.

" I like this a lot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

syntax on
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
set background=dark
color pablo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype go noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype python si ai 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
