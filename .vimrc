"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                        PADRÕES DE INICIALIZAÇÃO
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


"++ DEBIAN +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " Esta linha não deve ser removida para garantir que várias 
    " opções estão apropriadamente selecionadas para trabalhar 
    " com os pacotes Vim disponíveis no Debian.
    runtime! debian.vim

"++ SYNTAX HIGHLIGHTING ++++++++++++++++++++++++++++++++++++++++++++++++
    " Vim5 and versões mais antigas dão suporte a syntax highlighting. 
    " Esta linha ativa a syntax highlighting por padrão se disponível
    if has("syntax")
      syntax on
    endif

"++ VIMRC.LOCAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " Ativa o arquivo de configuração global se disponível
    if filereadable("/etc/vim/vimrc.local")
      source /etc/vim/vimrc.local
    endif

"++ OPÇÕES GERAIS ++++++++++++++++++++++++++++++++++++++++++++++++++++++
    set ruler           " Linhas e colunas no rodapé 
    set number          " Números no início das linhas
    set backspace=2     " Backspace age como em outros programas
    set background=dark " Fundo escuro (quem usa terminal branco?)
    set autowrite       " Salva automaticamente antes de :next e :make
    set tabstop=4       " Tamanho real da tabulação com 4 espaços 
    set softtabstop=4   " Tamanho aparente da tabulação com 4 espaços
    set shiftwidth=4    " Identação com 4 espaços de tabulação
                        " espaços (coisas de cartões perfurados...)
    
"++ PADRÃO DE CARACTERES +++++++++++++++++++++++++++++++++++++++++++++++
    set encoding=utf-8
    set fileencoding=utf-8
    	" Mude o padrão do código dos caracteres utilizados no Vim. Em
    	" geral, utf-8 (Unicode Transfer Format 8) consegue exibir a 
    	" maioria das línguas. É importante, porém, checar se a opção 
    	" +multi_byte está disponível ao digitar :version dentro do Vim.
    	" Se esta opção estiver indisponível ('-multi_byte'), recompile
    	" a partir do código (./configure --enable-multibyte)
    if has("multi_byte")
        set termencoding=utf-8
        " Permite que emuladores xterm mostrem caracteres utf-8.
    endif

"++ TABS POR ESPAÇOS +++++++++++++++++++++++++++++++++++++++++++++++++++
    au BufNewFile,BufRead,Filetype * set expandtab
        " Troca as tabulações por espaços, para evitar erros na dia-
        " gramação ao usar o VIM com outros tamanhos de 'tabstop'. 
        " A opção está com um autocomando porque o VIM não ativa au-
        " tomaticamente o expandtab pelo .vimrc (o autocomando é equi-
        " valente a digitar :set expandtab ao entrar em um documento, 
        " o que também corrige o problema).

"++ PESQUISA +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    set diffopt=filler,iwhite   " Ignorar espaços em branco
    set hlsearch                " highlight na pesquisa
    set incsearch               " Pesquisa enquanto digita
    set ignorecase              " Procurar ignorando diferenças de
                                " maiúsculas/minúsculas
    
    " Cores especiais para pesquisa normal/incremental
    hi    Search ctermbg=green ctermfg=black
    hi IncSearch ctermbg=black ctermfg=cyan

"++ POSIÇÃO DO CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++
    " Guarda posicao do cursor e histórico da linha de comando:
    set viminfo='10,\"30,:40,%,n~/.viminfo
    au BufReadPost * if line("'\"")|execute("normal `\"")|endif

"++ CONFIGURAÇÕES PARA LINGUAGES DE PROGRAMAÇÃO ++++++++++++++++++++++++
    source $HOME/.vim/ftplugin/c.vim
    source $HOME/.vim/ftplugin/c++.vim
    source $HOME/.vim/ftplugin/java.vim
    source $HOME/.vim/ftplugin/perl.vim
    source $HOME/.vim/ftplugin/python.vim


"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               ABREVIAÇÕES     
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ ARQUIVO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Abreviacoes uteis para salvar/sair
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq


"++ RÉGUA E COMENTÁRIO (TAMANHO 72) ++++++++++++++++++++++++++++++++++++
iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
iab CoM /** ***************************************************************/


"++ MATEMÁTICA +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    "Símbolos matemáticos de todos os tipos possíveis

"---- OPERADORES
iab _MAIS_MENOS_    ±
iab _TENSORIAL_     ⊗
iab _SOMA_DIRETA_   ⊕

"---- LÓGICA
iab _PARA_TODO_     ∀
iab _EXISTE_        ∃
iab _NAO_           ¬
iab _E_             ∧
iab _OU_            ∨
iab _PORTANTO_      ∴
iab _PORQUE_        ∵
iab _IMPLICA_       →
iab _SE_SO_SE_      ↔

"---- COMPARAÇÃO
iab _DIFERENTE_     ≠
iab _APROX_         ≈
iab _CONGRUENTE_    ≅
iab _EQUIVALENTE_   ≡
iab _MAIOR_IGUAL_   ≥
iab _MENOR_IGUAL_   ≤

"---- CÁLCULO
iab _FUNCAO_COMP_   ∘
iab _INFINITO_      ∞
iab _DIFERENCIAL_   ∂
iab _GRADIENTE_     ∇
iab _INTEGRAL_      ∫
iab _INTEG_LINHA_   ∮
iab _SOMATORIO_     ∑
iab _PRODUTORIO_    ∏

"---- CONJUNTOS
iab _VAZIO_         ∅
iab _NATURAIS_      ℕ
iab _INTEIROS_      ℤ
iab _RACIONAIS_     ℚ
iab _REAIS_         ℝ
iab _COMPLEXOS_     ℂ

"---- CONJUNTÍSTICA
iab _PERTENCE_      ∈
iab _NAO_PERTENCE_  ∉
iab _CONTEM_        ⊇
iab _CONTEM_DIF_    ⊃
iab _CONTIDO_       ⊆
iab _CONTIDO_DIF_   ⊂
iab _UNIAO_         U
iab _INTER_         ∩

"---- ÁLGEBRA LINEAR
iab _ORTOGONAL_     ⊥
iab _PROD_INTERNO_  ⟨⟩


"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               MAPEAMENTOS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"Os seguintes mapeamentos estão listados nesta seção:
"
"   |-------------------------------------------|
"   | LEGENDA:                                  |
"   | (I) Funciona no modo de inserção          |
"   | (V) Funciona no modo visual               |
"   | (A) Funciona nos modos normal e visual    |
"   |-------------------------------------------|
"
"   <C-INSERT>  (V) Copia do buffer para fora do programa
"                   (análogo a <S-INSERT> para colar de outro prog)
"
"   <S-TAB>:    (I) Completa uma palavra
"   <C-S-TAB>:  (I) Dá sequência a uma palavra
"   <C-D>:      (I) Procura no dicionário
"
"   <F3>: (A)   janela de erros do comando :make
"   <F4>: (A)   janela de navegação em pastas
"   <F5>: (A/I) troca de buffers (para múltiplas janelas abertas)
"   <F6>: (A)   esconde/revela os comentários
"   <F7>: (V)   comenta na forma C-ansi (para .c, .cpp e .java) 
"         (V)   comenta na dorma de Perl (para .pl ou .perl)
"   <F8>: (v)   descomenta na forma C-ansi (para .c, .cpp e .java) 
"         (V)   descomenta na dorma de Perl (para .pl ou .perl)
"   <F9>: (I)   liga/desliga identação automática
"   
"   <S-F7>: (V) comenta na forma C++ (para .cpp e .java)
"   <S-F8>: (V) descomenta na forma C++ (para .cpp e .java)


"++ COPIAR PARA FORA DO VIM 
    "vnoremap <c-insert> "+y
"if has('gui-running')
"    map  <s-insert> <MiddleMouse>
"    map! <s-insert> <MiddleMouse>
"endif

"++ DICIONÁRIO/ORTOGRAFIA E AUTOCOMPLETAMENTO 
    set dictionary=/home/verde/.ispell_br
    " Completa uma palavra
    imap <s-tab> <c-n>
    " Dá a sequência a essa palavra
    imap <c-s-tab> <c-x><c-n>
    " Procura no dicionário
    imap <c-d> <c-x><c-k>
    
"++ COMPILADOR (:make): <F3> 
    "Abre lista de erros do :make
    map <F3> <esc>:call Makerr()<cr>  
    "Leva ao próximo erro do :make
    map cn <esc>:cn<cr>               
    "Leva ao erro anterior do :make
    map cp <esc>:cp<cr>         

"++ FILE EXPLORER: <F4>
    map <F4> <esc>:Vexplore!<cr>

"++ ALTERNAR JANELAS: <F5>
    map <F5> <c-w><c-w>
    imap <F5> <esc><c-w><c-w>i

"++ ESCONDER COMENTÁRIOS: <F6>
    map <F6> :call CommOnOff()<cr>

"++ COMENTÁRIOS: <F7> e <F8>
    "Comentários C-ansi (/* e */) para código C, C++ e Java
    au BufNewFile,BufRead,Filetype c,c++,java call C_ansi_comm()
    "Comentários Perl (#) para código Perl e Bash
    au BufNewFile,BufRead,Filetype perl,bash call Perl_comm()

"++ IDENTAÇÃO AUTOMÁTICA: <F9> 
    imap <F9> <esc>:call Identation()<cr>a

"++ RECARREGAR VIMRC: <F12> 
    au BufNewFile,BufReadPost,Filetype * call Recharge_vimrc() 

"++ COMENTÁRIOS C++ (//): <S-F7> e <S-F8> 
    au BufNewFile,BufRead,Filetype *.cpp,*.java call Cpp_comm() 


"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               FUNÇÕES  
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ JANELA DE ERROS MOSTRADOS PELO MAKE ++++++++++++++++++++++++++++++++
    function! Makerr()
        vertical botright 30 copen
        echo " Make errors"
    endfunction

"++ ESCONDE COMENTÁRIOS ++++++++++++++++++++++++++++++++++++++++++++++++
    " E como somos chiques ainda criamos uma função vim pra fazer o 
    " serviço a CommOnOff() oculta/mostra os comentários, alternando.
    fu! CommOnOff()
        if !exists('g:hiddcomm')
            let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
        else
            unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
        endif
    endfu

"++ COMENTÁRIOS C-ANSI (/* e */) +++++++++++++++++++++++++++++++++++++++
    function! C_ansi_comm()
        vmap <F7> :s/\/\*/\\%/e<cr><c-v>gv:s/\*\//%\\/e<cr> 
                    \ <c-v>gvI/*<esc><c-v>gv$A*/<esc>:let @/=""<CR>
                    \ <esc>:echo " Comment"<CR>
        " O comando acima retira os comentários C-ansi (/* e */) e os
        " transforma em \% e %\ (sem valor para a linguagem C). Em se-
        " guida, coloca /* e */ no início e no fim do bloco.
        vmap <F8> :s/\*\///e<cr><c-v>gv:s/\/\*//e<cr>
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
        vmap <F8> :s/^# //gi<cr>:let @/=""<CR>
                  \ <esc>:echo " Uncomment"<CR>
    endfunction

"++ COMENTÁRIOS C++ (//) +++++++++++++++++++++++++++++++++++++++++++++++
    function! Cpp_comm()
        "Comenta código C++ e Java com comentários de estilo C++
        vmap <S-F7> :s/^/\/\//gi<cr>:let @/=""<CR>
                    \ <esc>:echo " Comment"<CR>
        "Descomenta código C++ e Java com comentários de estilo C++
        vmap <S-F8> :s/^\/\///gi<cr>:let @/=""<CR>
                    \ <esc>:echo " Uncomment"<CR>
    endfunction
    
"++ IDENTAÇÃO AUTOMÁTICA +++++++++++++++++++++++++++++++++++++++++++++++
    function! Identation()
        set autoindent!
        set smartindent!
        set shiftround!
        set shiftwidth=4
        set copyindent!
        set preserveindent!
    endfunction

"++ RECARREGAR VIMRC ++++++++++++=++++++++++++++++++++++++++++++++++++++
    function! Recharge_vimrc()
        if &term == "win32" || "pcterm" || has("gui_win32")
           map ,v :e $HOME/_vimrc<CR>
           nmap <F12> :<C-u>source ~/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
        else
           map ,v :e $HOME/.vimrc<CR>
           nmap <F12> :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
        endif
    endfunction
