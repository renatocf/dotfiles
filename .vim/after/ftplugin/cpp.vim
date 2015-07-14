"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  C++ 
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" Tags para C++
setlocal tags+=$HOME/.vim/tags/cpp.tags

" Syntax highlight do Doxygen 
set syntax=cpp.doxygen

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
