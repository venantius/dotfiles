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
set cindent " replaceing smartindent because of some weird stuff with # symbols
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
set winwidth=79
" Suspect, but GB claims necessary for RVM
set shell=bash
set scrolloff=3
set showcmd
" Should look into WildMode some more. Seems pretty handy.

" I like this a lot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set nobackup
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
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = '%<%t%m'
    let g:airline_section_warning = airline#section#create(['syntastic'])
endfunction
autocmd VimEnter * if exists(':AirlineToggle') | call AirlineInit()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au Filetype html setlocal sw=2 ts=2 sts=2
au Filetype less setlocal sw=2 ts=2 sts=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype clojure nmap <c-c><c-k> :Require<cr>
au Filetype clojure let g:clojure_fuzzy_indent = 1
au Filetype clojure let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
au BufNewFile,BufRead *.edn set filetype=clojure
au Filetype clojure autocmd BufWritePre * :%s/\s\+$//e

" DLowe's test function
function! TestToplevel() abort
    "Eval the toplevel clojure form (a deftest) and then test-var the
    "result."
    normal! ^
    let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
    let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
    let expr = join(getline(line1, line2), "\n")
    let var = fireplace#session_eval(expr)
    let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
    return result
endfunction
au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>

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
" JavaScript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
