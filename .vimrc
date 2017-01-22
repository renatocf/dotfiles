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
set autowrite             " Save before commands that jump between files
set backspace=2           " Make backspace act as in other programs
set nocompatible          " Enable resources better than VI's
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

"++ SEARCH +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set diffopt=filler,iwhite " Ignore blang spaces
set hlsearch              " highlight in search
set incsearch             " Search while typing

" Ignore filetypes when searching for files
set wildignore=*.swp,*.class,*.exe,*.o,*obj

" Set special colors for incremental/normal search
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

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

" General-purpose plugins
Plug 'nacitar/a.vim'
Plug 'viklund/bio-vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-syntastic/syntastic'
Plug 'dkprice/vim-easygrep'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Filetype-specific plugins
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

" Clang-dependent plugins
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/ycm-generator', { 'branch': 'stable'}

if has('nvim')
    Plug 'arakashic/chromatica.nvim', {
        \ 'for': ['c', 'cpp', 'objc', 'objcpp'] }
else
    Plug 'jeaye/color_coded', {
        \ 'do': 'cmake . && make && make install',
        \ 'for': ['c', 'cpp', 'objc', 'objcpp'] }
endif

" End list of plugins
call plug#end()

"++ FLAGS (YouCompleteMe) ++++++++++++++++++++++++++++++++++++++++++++++

let g:ycm_register_as_syntastic_checker = 1

let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1

let g:ycm_complete_in_strings = 1

"++ FLAGS (Chromatica) +++++++++++++++++++++++++++++++++++++++++++++++++

let g:chromatica#enable_at_startup = 1
let g:chromatica#highlight_feature_level = 1

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
map <F2> :NERDTreeToggle<cr>

"++ File explorer: <F4>
map <F4> :TagbarToggle<cr>

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
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
endif
