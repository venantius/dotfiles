" Venantius' .vimrc

autocmd!
execute pathogen#infect()
execute pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'

" Plugin 'cespare/vim-toml'
" Plugin 'exu/pgsql.vim'
" Plugin 'godlygeek/tabular'
" Plugin 'junegunn/goyo.vim'
" Plugin 'junegunn/limelight.vim'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-surround'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vimwiki/vimwiki.vim'
" Plugin 'VundleVim/Vundle.vim'

" call vundle#end()

set compatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CORE EDITING SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set wildmenu
set wildmode=list:longest
set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent " replaceing smartindent because of some weird stuff with # symbols
set laststatus=2
set backspace=indent,eol,start
set number
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set winwidth=79
set shell=bash
set scrolloff=3
set showcmd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

syntax enable
filetype indent plugin on

let mapleader=','
set pastetoggle=<Leader>t
map <Leader>d <C-]>

" Force yourself to not use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set t_Co=256
colorscheme solarized
set background=dark

highlight Comment cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" goyo / limelight

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"
" " Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"
" " Default: 0.5
let g:limelight_default_coefficient = 0.7
"
 " Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1



" vim-markdown
let g:vim_markdown_folding_disabled=1
au filetype Markdown set conceallevel=2


" vimwiki
let g:vimwiki_list = [{'path': '~/Code/wiki'}]

" NERDtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_python_checkers = ['pep8']
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]


" vim-airline
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts = 1
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = '%<%t%m'
endfunction
autocmd VimEnter * if exists(':AirlineToggle') | call AirlineInit()


" vim-cljfmt
let g:clj_fmt_autosave = 1


" vim-fugitive
let g:fugitive_github_domains = ['github.com', 'git.airbnb.com']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au Filetype html setlocal sw=2 ts=2 sts=2
au Filetype less setlocal sw=2 ts=2 sts=2

" MIT Scheme (+slimv)
au Filetype scheme set textwidth=80
let g:slimv_swank_cmd = '! tmux new-session -d -n swank-mit-scheme "scheme --load ~/.vim/bundle/slimv/slime/contrib/swank-mit-scheme.scm"'
" let g:swank_log=1

" Clojure
au Filetype clojure nmap <c-c><c-k> :Require<cr>
au Filetype clojure let g:clojure_fuzzy_indent = 1
au Filetype clojure let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
au BufNewFile,BufRead *.edn set filetype=clojure
" au Filetype clojure autocmd BufWritePre * :%s/\s\+$//e
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


" JavaScript / JSX / React
let g:jsx_ext_required = 0

au BufNewFile,BufRead *.bb set filetype=clojure

" C
auto FileType c set noexpandtab softtabstop=4 tabstop=4 shiftwidth=4

" Go
au FileType go set noexpandtab softtabstop=4 tabstop=4 shiftwidth=4


" HTML
au Filetype html set tabstop=2 shiftwidth=2


" YAML
au Filetype yaml set tabstop=2 shiftwidth=2


" Ruby
au Filetype ruby set tabstop=2 shiftwidth=2
au Filetype eruby set tabstop=2 shiftwidth=2
au Filetype ruby autocmd BufWritePre * :%s/\s\+$//e


" Rust
set hidden
let g:racer_cmd = "/Users/ursa/.cargo/bin/racer"
let $RUST_SRC_PATH="/Users/ursa/Code/school/the_rust_programming_language/projects/guessing_game/src"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
au BufWinEnter *.rs set mps-=<:>


" SQL
let g:sql_type_default = 'pgsql' " I use Postgres a lot

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

set encoding=utf-8

" Faster ctrlP search
let g:ctrlp_lazy_update = 100 "Only refreshes the results every 100ms so if you type fast searches don't pile up
let g:ctrlp_user_command = 'find %s -type f | egrep -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)|(/\.)|((^|\/)tmp\/)"' "Quicker indexing

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
