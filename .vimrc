"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                            CONFIGURATIONS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ DEBIAN +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" This line should not be removed to guarantee that many options are
" appropriately selected to work with Vim packages available in Debian
runtime! debian.vim

"++ SYNTAX HIGHLIGHTING ++++++++++++++++++++++++++++++++++++++++++++++++
" This line enables syntax highlighting
if has('syntax')
    syntax on
endif

"++ BASIC OPTIONS ++++++++++++++++++++++++++++++++++++++++++++++++++++++
set ruler                 " Put a ruler in the footer
set title                 " Change the terminal title
set number                " Add numbers in the lines
set mouse=a               " Enable mouse usage
set autowrite             " Save before commands that jump between files
set backspace=2           " Make backspace act as in other programs
set nocompatible          " Enable resources better than VI's
set encoding=utf8         " Use UTF-8 as the default encoding
set background=dark       " Set dark background by default

"++ IDENTATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
filetype plugin indent on " Enable Identation for different languages
set wrap                  " Show big lines without horizontal rolling
set tabstop=2             " Make tabstop be 2 spaces by default
set expandtab             " Change tabs by spaces
set linebreak             " Wrap lines only in the end of words
set textwidth=80          " 80 columns as maximum width
set shiftwidth=0          " Make autoindent space equal to 'tabstop'
set matchpairs+=<:>       " Also match < and > (for C++ mainly)

" Use better fonts for plugins
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                              PLUGINS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ INSTALLATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Start list of plugins
" Check interesting stuff at http://vimawesome.com/
call plug#begin('~/.vim/plugged')

" Local vimrc
Plug 'embear/vim-localvimrc'

" General-purpose plugins
Plug 'w0rp/ale'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'nacitar/a.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'viklund/bio-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-fugitive'
Plug 'dietsche/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'jceb/vim-orgmode'
Plug 'in3d/vim-raml'
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-session'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'
Plug 'posva/vim-vue'

" Filetype-specific plugins
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

" Clang-dependent plugins
Plug 'valloric/youcompleteme', {
    \ 'do': './install.py --clang-completer' }
Plug 'rdnetto/ycm-generator', {
    \ 'branch': 'stable' }

if has('nvim')
    Plug 'arakashic/chromatica.nvim', {
        \ 'for': ['c', 'cpp', 'objc', 'objcpp'] }
else
    Plug 'jeaye/color_coded', {
        \ 'do': 'cmake . && make && make install',
        \ 'for': ['c', 'cpp', 'objc', 'objcpp'] }
endif

" Icon plugins
Plug 'ryanoasis/vim-devicons'

" End list of plugins
call plug#end()

"++ FLAGS (YouCompleteMe) ++++++++++++++++++++++++++++++++++++++++++++++

let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_filetype_blacklist = {
      \ 'vim'      : 1,
      \ 'tagbar'   : 1,
      \ 'qf'       : 1,
      \ 'notes'    : 1,
      \ 'markdown' : 1,
      \ 'unite'    : 1,
      \ 'text'     : 1,
      \ 'vimwiki'  : 1,
      \ 'pandoc'   : 1,
      \ 'infolog'  : 1,
      \ 'mail'     : 1
      \}

"++ FLAGS (Chromatica) +++++++++++++++++++++++++++++++++++++++++++++++++
" let g:chromatica#enable_at_startup = 1

"++ FLAGS (Devicons) +++++++++++++++++++++++++++++++++++++++++++++++++++
let g:airline_powerline_fonts = 1

"++ FLAGS (Incsearch) ++++++++++++++++++++++++++++++++++++++++++++++++++
let g:incsearch#auto_nohlsearch = 1

"++ FLAGS (JavaScript Libraries Syntax) ++++++++++++++++++++++++++++++++
let g:used_javascript_libs = 'jquery,d3,vue'

"++ FLAGS (Session) ++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

"++ FLAGS (ALE) ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:ale_echo_msg_format = '%severity%(%linter%): %s'

"++ FLAGS (Local vimrc) ++++++++++++++++++++++++++++++++++++++++++++++++
let g:localvimrc_ask = 0

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                             ABBREVIATIONS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" Abbreviations useful to save and exit
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq
cab Wa wa | cab Qa qa | cab Wqa wqa | cab wQa wqa | cab wqA wqa
cab WQa wqa | cab WqA wqa | cab wQA wqa | cab WQA wqa

" Rule to measure columns (size 80)
iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                MAPPINGS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ File explorer: <F2>
map <F2> :NERDTreeToggle<CR>

"++ Fix code: <F3>
map <F3> :YcmCompleter FixIt<CR>

"++ File explorer: <F4>
map <F4> :TagbarToggle<CR>

"++ Incsearch plugin
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"++ Move lines: <A-*>
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==

inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
inoremap <C-Down> <Esc>:m .+1<CR>==gi

vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

"++ Change of context: <A-*>
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-Up> <C-w>k
nnoremap <A-Down> <C-w>j
nnoremap <A-Left> <C-w>h
nnoremap <A-Right> <C-w>l

inoremap <A-k> <Esc><C-w>k
inoremap <A-j> <Esc><C-w>j
inoremap <A-h> <Esc><C-w>h
inoremap <A-l> <Esc><C-w>l
inoremap <A-Up> <Esc><C-w>k
inoremap <A-Down> <Esc><C-w>j
inoremap <A-Left> <Esc><C-w>h
inoremap <A-Right> <Esc><C-w>l

vnoremap <A-k> <Esc><C-w>k
vnoremap <A-j> <Esc><C-w>j
vnoremap <A-h> <Esc><C-w>h
vnoremap <A-l> <Esc><C-w>l
vnoremap <A-Up> <Esc><C-w>k
vnoremap <A-Down> <Esc><C-w>j
vnoremap <A-Left> <Esc><C-w>h
vnoremap <A-Right> <Esc><C-w>l

if has('nvim')
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-l> <C-\><C-n><C-w>l
    tnoremap <A-Up> <C-\><C-n><C-w>k
    tnoremap <A-Down> <C-\><C-n><C-w>j
    tnoremap <A-Left> <C-\><C-n><C-w>h
    tnoremap <A-Right> <C-\><C-n><C-w>l

    " Fix to enter a terminal buffer in terminal mode
    autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif
endif
