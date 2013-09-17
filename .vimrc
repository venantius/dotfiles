" Venantius' .vimrc
"TODO: There are other configurables for our .vimrc that we might care about; I think pushing "-O" into our .bashrc is the type of thing we might want, which would necessitate defining either 'winheight' or 'winwidth' in our .vimrc

autocmd!
execute pathogen#infect()
execute pathogen#helptags()
"""""""""""""""""""""""""""
" CORE EDITING SETTINGS
"""""""""""""""""""""""""""

set nocompatible
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set backspace=indent,eol,start
set number

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype go noexpandtab
au BufWritePre *.go :silent Fmt
set rtp+=/misc/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au Filetype python 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
