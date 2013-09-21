" Venantius' .vimrc
"TODO: There are other configurables for our .vimrc that we might care about; I think pushing "-O" into our .bashrc is the type of thing we might want, which would necessitate defining either 'winheight' or 'winwidth' in our .vimrc

autocmd!
execute pathogen#infect()
execute pathogen#helptags()
"""""""""""""""""""""""""""
" CORE EDITING SETTINGS
"""""""""""""""""""""""""""

set nocompatible
" set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

" Commented lines are the defaults
function! AirlineInit()
    " let g:airline_section_a = '%{airline#util#wrap(airline#parts#mode(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#parts#iminsert(),0)}'
    " let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])"
    let g:airline_section_b = airline#section#create(['branch'])
    " let g:airline_section_b = ''
    let g:airline_section_c = '%<%t%m'
" let g:airline_section_gutter = '%#airline_file#%{airline#util#wrap(airline#parts#readonly(),0)}%='
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#syntastic#get_warnings(),0)}'
" let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),0)}'
" let g:airline_section_y = '%{airline#util#wrap(airline#parts#ffenc(),0)}'
" let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr} %3l:%3c'
endfunction
autocmd VimEnter * call AirlineInit()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype go noexpandtab
au BufWritePre *.go :silent Fmt
" set rtp+=/misc/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au Filetype python

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
