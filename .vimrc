"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                            CONFIGURATIONS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ SYNTAX HIGHLIGHTING ++++++++++++++++++++++++++++++++++++++++++++++++
" This line enables syntax highlighting
if has('syntax')
  syntax on
endif

"++ BASIC OPTIONS ++++++++++++++++++++++++++++++++++++++++++++++++++++++
set ruler                 " Put a ruler in the footer
set title                 " Change the terminal title
set hidden                " if hidden is not set, COC might fail.
set number                " Add numbers in the lines
set mouse=a               " Enable mouse usage
set undofile              " Persistent undo
set autowrite             " Save before commands that jump between files
set lazyredraw            " Do not redraw screen in the middle of macros
set backspace=2           " Make backspace act as in other programs
set cmdheight=2           " Better display for messages
set nocompatible          " Enable resources better than VI's
set encoding=utf8         " Use UTF-8 as the default encoding
set updatetime=300        " Smaller updatetime for CursorHold
set background=dark       " Set dark background by default
set clipboard=unnamedplus " Allow copying to system clipboard

if has('nvim')
  set inccommand=nosplit " Realtime changes for ex commands
  autocmd TermOpen * setlocal nonumber
endif

"++ IDENTATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
filetype plugin indent on " Enable Identation for different languages
set wrap                  " Show big lines without horizontal rolling
set tabstop=2             " Make tabstop be 2 spaces by default
set expandtab             " Change tabs by spaces
set linebreak             " Wrap lines only in the end of words
set textwidth=80          " 80 columns as maximum width
set shiftwidth=0          " Make autoindent space equal to 'tabstop'
set matchpairs+=<:>       " Also match < and > (for C++ mainly)

"++ COLORS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set cursorline

if has('termguicolors')
  set termguicolors
endif

" Use better fonts for plugins
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                              PLUGINS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ INSTALLATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Start list of plugins
" Check interesting stuff at http://vimawesome.com/
call plug#begin('~/.vim/plugged')

" Local vimrc
Plug 'embear/vim-localvimrc'

" General-purpose plugins
Plug 'nacitar/a.vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'viklund/bio-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nicwest/vim-camelsnek'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-fugitive'
Plug 'dietsche/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-session'
Plug 'tpope/vim-surround'

" NERDTree and plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Colors schemes
Plug 'base16-project/base16-vim'

" Filetype-specific plugins
Plug 'othree/html5.vim'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'kylef/apiblueprint.vim', { 'for': 'apiblueprint' }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'in3d/vim-raml', { 'for': 'raml' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'posva/vim-vue', { 'for': 'vue' }

" Clang-dependent plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"++ FLAGS (BASE16) +++++++++++++++++++++++++++++++++++++++++++++++++++++

" source ~/.config/nvim/colorscheme.vim
if exists('$BASE16_THEME')
    \ && (!exists('g:colors_name')
    \ || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
else
  colorscheme base16-bright
endif

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

"++ FLAGS (NVIM) +++++++++++++++++++++++++++++++++++++++++++++++++++++++

let g:terminal_scrollback_buffer_size = 16384

"++ FLAGS (Devicons) +++++++++++++++++++++++++++++++++++++++++++++++++++
let g:airline_powerline_fonts = 1

"++ FLAGS (Incsearch) ++++++++++++++++++++++++++++++++++++++++++++++++++
let g:incsearch#auto_nohlsearch = 1

"++ FLAGS (JavaScript Libraries Syntax) ++++++++++++++++++++++++++++++++
let g:used_javascript_libs = 'jquery,d3,vue'

"++ FLAGS (NERDTree) +++++++++++++++++++++++++++++++++++++++++++++++++++
let NERDTreeIgnore = ['__pycache__','\.pyc$']

"++ FLAGS (Session) ++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

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

"++ Undo tree: <F5>
map <F5> :UndotreeToggle<CR>

if has('nvim')
  "++ Open IDE mode: <F6>
  map <F6> :NERDTreeToggle<CR><A-Right>:vs<CR><A-Right>:sp<CR>:term<CR><A-Down>:term<CR><A-Left><CR>

  "++ Open Side Terminal: <F7>
  command! Vst :vs | :normal <A-Right> | :term<Cr>
  map <F7> :Vst<Cr>

  "++ Open Low Terminal: <F8>
  command! Spt :sp | :normal <A-Down> | :resize 12 | :term<CR>
  map <F8> :Spt<Cr>
endif

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
nnoremap <silent> <C-k> :m .-2<CR>==
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-Up> :m .-2<CR>==
nnoremap <silent> <C-Down> :m .+1<CR>==

inoremap <silent> <C-k> <Esc>:m .-2<CR>==gi
inoremap <silent> <C-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <C-Down> <Esc>:m .+1<CR>==gi

vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv

"++ Change of context: <A-*>
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-l> <C-w>l
nnoremap <silent> <A-Up> <C-w>k
nnoremap <silent> <A-Down> <C-w>j
nnoremap <silent> <A-Left> <C-w>h
nnoremap <silent> <A-Right> <C-w>l

inoremap <silent> <A-k> <Esc><C-w>k
inoremap <silent> <A-j> <Esc><C-w>j
inoremap <silent> <A-h> <Esc><C-w>h
inoremap <silent> <A-l> <Esc><C-w>l
inoremap <silent> <A-Up> <Esc><C-w>k
inoremap <silent> <A-Down> <Esc><C-w>j
inoremap <silent> <A-Left> <Esc><C-w>h
inoremap <silent> <A-Right> <Esc><C-w>l

vnoremap <silent> <A-k> <Esc><C-w>k
vnoremap <silent> <A-j> <Esc><C-w>j
vnoremap <silent> <A-h> <Esc><C-w>h
vnoremap <silent> <A-l> <Esc><C-w>l
vnoremap <silent> <A-Up> <Esc><C-w>k
vnoremap <silent> <A-Down> <Esc><C-w>j
vnoremap <silent> <A-Left> <Esc><C-w>h
vnoremap <silent> <A-Right> <Esc><C-w>l

if has('nvim')
  tnoremap <silent> <A-k> <C-\><C-n><C-w>k
  tnoremap <silent> <A-j> <C-\><C-n><C-w>j
  tnoremap <silent> <A-h> <C-\><C-n><C-w>h
  tnoremap <silent> <A-l> <C-\><C-n><C-w>l
  tnoremap <silent> <A-Up> <C-\><C-n><C-w>k
  tnoremap <silent> <A-Down> <C-\><C-n><C-w>j
  tnoremap <silent> <A-Left> <C-\><C-n><C-w>h
  tnoremap <silent> <A-Right> <C-\><C-n><C-w>l

  " Fix to enter a terminal buffer in terminal mode
  autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif
endif

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  COC
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" Add default list of extensions
let g:coc_global_extensions = [
      \ "coc-lists",
      \ "coc-html",
      \ "coc-highlight",
      \ "coc-emmet",
      \ "coc-yaml",
      \ "coc-xml",
      \ "coc-vimlsp",
      \ "coc-vetur",
      \ "coc-svg",
      \ "coc-svelte",
      \ "coc-stylelint",
      \ "coc-metals",
      \ "coc-kotlin",
      \ "coc-json",
      \ "coc-elixir",
      \ "coc-css",
      \ "coc-python",
      \ "coc-snippets",
      \ ]

" don't give |ins-completion-menu| messages.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ },
  \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
