"++ COMENTÁRIOS: <F7> e <F8>
    "Comentários C-ansi (/* e */) para código C, C++ e Java
    au BufNewFile,BufRead,Filetype c,c++,java call C_ansi_comm()
    "Comentários Perl (#) para código Perl e Bash
    au BufNewFile,BufRead,Filetype perl,bash call Perl_comm()

"++ COMENTÁRIOS C++ (//): <S-F7> e <S-F8> 
    au BufNewFile,BufRead,Filetype *.cpp,*.java call Cpp_comm() 


"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               FUNÇÕES  
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


"++ COMENTÁRIOS C-ANSI (/* e */) +++++++++++++++++++++++++++++++++++++++
    function! C_ansi_comm()
        vmap <F7> :s/\/\*/\\%/e<cr><c-v>gv:s/\*\//%\\/e<cr> 
                    \ <c-v>gvI/*<esc><c-v>gv$A*/<esc>:let @/=""<CR>
                    \ <esc>:echo " Comment"<CR>
        " O comando acima retira os comentários C-ansi (/* e */) e os
        " transforma em \% e %\ (sem valor para a linguagem C). Em se-
        " guida, coloca /* e */ no início e no fim do bloco.
        vmap <S-F8> :s/\*\///e<cr><c-v>gv:s/\/\*//e<cr>
                    \ <c-v>gv:s/\\%/\/\*/e<cr><c-v>gv:s/%\\/\*\//e<cr>
                    \ :let @/=""<CR><esc>:echo " Uncomment"<CR>
        " Retira /* e */ colocados no comando acima e transforma os 
        " caracteres \% e %\ criados por ele de volta em /* e */, 
        " devolvendo o código original.
    endfunction

"++ COMENTÁRIOS PERL (#) +++++++++++++++++++++++++++++++++++++++++++++++
    function! Perl_comm()
        "Comenta código Perl com comentários #
        vmap <F7> :s/^/# /gi<cr>:let @/=""<CR>
                  \ <esc>:echo " Comment"<CR>
        "Descomenta código Perl com comentários #
        vmap <S-F7> :s/^# //gi<cr>:let @/=""<CR>
                    \ <esc>:echo " Uncomment"<CR>
    endfunction

"++ COMENTÁRIOS C++ (//) +++++++++++++++++++++++++++++++++++++++++++++++
    function! Cpp_comm()
        "Comenta código C++ e Java com comentários de estilo C++
        vmap <C-F7> :s/^/\/\//gi<cr>:let @/=""<CR>
                    \ <esc>:echo " Comment"<CR>
        "Descomenta código C++ e Java com comentários de estilo C++
        vmap <C-S-F7> :s/^\/\///gi<cr>:let @/=""<CR>
                      \ <esc>:echo " Uncomment"<CR>
    endfunction
