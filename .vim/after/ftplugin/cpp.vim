"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  C++ 
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" Tags para C++
setlocal tags+=$HOME/.vim/tags/cpp.tags

" Syntax highlight do Doxygen 
set syntax=cpp.doxygen

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Identação para C++
set wrap
set tabstop=2
set expandtab
set linebreak
set textwidth=80
set shiftwidth=2
set softtabstop=2

"++ COMPILAÇÃO DO CÓDIGO (SEM MAKE): <F8>
    autocmd VimEnter *
    \   if exists(":SCCompile")
    \|      exe "map <F8> :SCCompileAF -std=c++11<CR>"
    \|  else
    \|      exe ":echo 'No compiler plugin instaled'"
    \|  endif

"++ COMPILAÇÂO E EXECUÇÃO DO CÓDIGO (SEM MAKE): <F9>
    autocmd VimEnter *
    \   if exists(":SCCompileRun")
    \|      exe "map <F9> :SCCompileRunAF -std=c++11<CR>"
    \|  else
    \|      exe ":echo 'No compiler plugin instaled'"
    \|  endif
