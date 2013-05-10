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
    set title           " Muda o título do terminal
    set number          " Números no início das linhas
    set autowrite       " Salva (:w) antes de :next e :make
    set backspace=2     " Backspace age como em outros programas
    set nocompatible	" Permite recursos maiores que os do VI
    set background=dark " Fundo escuro (quem usa terminal branco?)

"++ PADRÃO DE CARACTERES +++++++++++++++++++++++++++++++++++++++++++++++
    if has("multi_byte")
    	" Mude o padrão do código dos caracteres utilizados no Vim. Em
    	" geral, utf-8 (Unicode Transfer Format 8) consegue exibir a 
    	" maioria das línguas. É importante, porém, checar se a opção 
    	" +multi_byte está disponível ao digitar :version dentro do Vim.
    	" Se esta opção estiver indisponível ('-multi_byte'), recompile
    	" a partir do código (./configure --enable-multibyte)
		set encoding=utf-8
		set fileencoding=utf-8
        set termencoding=utf-8 "Emuladores xterm com utf-8.
    endif

"++ IDENTAÇÃO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    filetype plugin indent on   " Identações para diferentes linguagnes
    set wrap          " Linhas grandes exibidas sem rolagem horizontal
    set tabstop=4     " Tamanho real da tabulação com 4 espaços 
    set expandtab     " Troca tabulações por espaços
    set linebreak     " Quebra de linha extensa só em final de palavra
    set textwidth=72  " 72 de largura máxima (coisa de cartão perfurado)
    set shiftwidth=4  " Identação com 4 espaços de tabulação
    set softtabstop=4 " Tamanho aparente da tabulação com 4 espaços

"++ PESQUISA +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    set diffopt=filler,iwhite   " Ignorar espaços em branco
    set hlsearch                " highlight na pesquisa
    set incsearch               " Pesquisa enquanto digita
    set ignorecase              " Procurar ignorando diferenças de
                                " maiúsculas/minúsculas
    
    " Arquivos ignorados ao exandir busca por arquivos
    set wildignore=*.swp,*.class,*.exe,*.o,*obj
    
    " Cores especiais para pesquisa normal/incremental
    hi    Search ctermbg=green ctermfg=black
    hi IncSearch ctermbg=black ctermfg=cyan
   
"++ POSIÇÃO DO CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++
    " Guarda posicao do cursor e histórico da linha de comando:
    set viminfo='10,\"30,:40,%,n~/.viminfo
    au BufReadPost * if line("'\"")|execute("normal `\"")|endif
    
"++ STATUSLINE +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    set statusline=%t                " Nome do arquivo
    set statusline+=\ \ \ [          " Limite formato/decod.
    set statusline+=%{strlen(&fenc)?
                    \&fenc:'none'}   " Codificação
    set statusline+=,                " Separador formato/decod.
    set statusline+=%{&ff}           " Formato do arquivo
    set statusline+=]                " Limite formato/decod.
    set statusline+=%h               " Sinal de ajuda   [help]
    set statusline+=%m               " Sinal modificado [+]
    set statusline+=%r               " Sinal só-leitura [RO]
    set statusline+=%y               " Formato do arquivo
    set statusline+=%=               " Separador direita/esquerda
    set statusline+=%c,              " Coluna do cursos
    set statusline+=%l/%L            " Linha do cursor/total de linhas
    set statusline+=\ \ \ \ %P       " Porcentagem na tela

"++ PLUGINS (PATHOGEN) +++++++++++++++++++++++++++++++++++++++++++++++++
    runtime bundle/pathogen/autoload/pathogen.vim
    call pathogen#infect()

"++ JANELA DE POPUP ++++++++++++++++++++++++++++++++++++++++++++++++++++
    " Janela de popup mais completa
    set completeopt=menuone,menu,longest,preview
    " Abre/fecha automaticamente a janela do menu popup
    au InsertLeave  * if pumvisible() == 0 | silent! pclose | endif
    au CursorMovedI * if pumvisible() == 0 | silent! pclose | endif
   
"++ SUPERTAB +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " SuperTab plugin
    " let g:SuperTabDefaultCompletionType = "context"
    autocmd FileType *
    \   if &omnifunc != ''
    \|    call SuperTabChain(&omnifunc, "<c-p>")
    \|    call SuperTabSetDefaultCompletionType("<c-x><c-u>")
    \|  endif
    " set wildmode=longest,list
    
    let g:SuperTabMappingTabLiteral = "<leader><tab>"

"++ SINTAXE (SYNTASTIC) +++++++++++++++++++++++++++++++++++++++++++++++
    let g:syntastic_mode_map = { 'mode': 'passive' }
    " Deixa o corretor de sintaxe syntastic funcionar no mod passivo,
    " só podendo sendo processado ao chamar o comando "SyntaxCheck"
    let g:syntastic_loc_list_height=5
    " Tamanho da lista de erros do Syntastic
    let g:syntastic_auto_loc_list=1
    " Janela de erros abre ao checar, e fecha quando não há mais erros
    
"++ BIOINFORMÁTICA ++++++++++++++++++++++++++++++++++++++++++++++++++++
    augroup Bioinformatics
        au BufNewFile,BufRead *.{fa,fasta}         setf fasta
        au BufNewFile,BufRead *.faa                setf fasta_aa
        au BufNewFile,BufRead *.{ffn,fna}          setf fasta_nt
        au BufNewFile,BufRead *.{gff,gff3,gtf}     setf gff
        au BufNewFile,BufRead *.{gbk,genbank}      setf genbank
        au BufNewFile,BufRead *.{nex,nexus,nxs,nx} setf nexus
    augroup end
    
    " Usa tabulações em todos os arquivos fasta
    au BufNewFile,BufRead,Filetype *.f{a,aa,fn,na,asta} set noexpandtab
    
"++ ASSEMBLY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    au VimEnter,BufNewFile,BufRead *.asm exe "setf nasm"

"++ LaTeX +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " Aplicações requeridas pelo plugin vim-latex
    set grepprg=grep\ -nH\ $*
    let g:tex_flavor='latex'

"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               ABREVIAÇÕES     
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ ARQUIVO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " Abreviacoes uteis para salvar/sair
    cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq

"++ RÉGUA E COMENTÁRIO (TAMANHO 72) ++++++++++++++++++++++++++++++++++++
    iab RuL 
  \ ----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
    iab CoM 
  \ /** ***************************************************************/


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
"   <TAB>:    (I) Avança para baixo na lista de autocompletamento
"   <S-TAB>:  (I) Avança para cima na lista de autocompletamento
"   '<TAB>:   (I) Adiciona tabulação
"
"   <F2>: (A)   janela com lista de tags
"   <F3>: (A)   janela de erros do comando :make
"   <F4>: (A)   janela de navegação em pastas
"   <F5>: (A/I) troca de buffers (para múltiplas janelas abertas)
"   <F6>: (A)   esconde/revela os comentários
"   <F7>: (V)   comenta/descomenta código
"   <F8>: (A)   compilação do código (sem make)
"   <F9>: (A)   compilação e execução do código (sem make)


"++ DICIONÁRIO/ORTOGRAFIA E AUTOCOMPLETAMENTO 
    set dictionary=/home/verde/.ispell_br

"++ LISTA DE TAGS (:TlistToggle): <F2> 
    autocmd VimEnter *
    \   if exists(":TlistToggle")
    \|      exe "map <F2> :TlistToggle<CR>" 
    \|      exe "let Tlist_Auto_Update = 1"
    \|      exe "map <s-F2> :TlistUpdate<CR>" 
    \|      exe "let Tlist_Exit_OnlyWindow = 1" 
    \|      exe "let Tlist_Use_Right_Window = 1" 
    \|      exe "let Tlist_File_Fold_Auto_Close = 1"
    \|  elseif exists(":TagbarToggle")
    \|      exe "map <F2> :TagbarToggle<CR>" 
    \|  else
    \|      exe "echo 'No Tag list manager avaiable'"
    \|  endif
    
"++ COMPILADOR (:make): <F3> 
    "Abre lista de erros do :make
    autocmd BufNewFile,BufRead * 
    \   if exists(":Errors")
    \|      exe "map <F3> <esc>:w<cr>:SyntasticCheck<cr>"
    \|      exe "imap <F3> <esc>:w<cr>:SyntasticCheck<cr>i"
    \|  else
    \|      exe "map <F3> <esc>:call Makerr()<cr>"  
    "Leva ao próximo erro do :make
    map cn <esc>:cn<cr>               
    "Leva ao erro anterior do :make
    map cp <esc>:cp<cr>         

"++ FILE EXPLORER: <F4>
    autocmd VimEnter * 
    \   if exists(":NERDTreeToggle") 
    \|      exe "map <F4> :call Resize('NERDTreeToggle', 30, 0)<cr>" 
    \|  else
    \|      exe "map <F4> :Vex!<CR>"
    \|  endif

"++ ALTERNAR JANELAS: <F5>
    map <F5> <c-w><c-w>
    imap <F5> <esc><c-w><c-w>i

"++ ESCONDER COMENTÁRIOS: <F6>
    map <F6> :call CommOnOff()<cr>

"++ COMENTÁRIOS: <F7> 
    autocmd VimEnter * 
    \   if exists(":TComment") 
    \|      exe "map <F7> :TComment<CR>" 
    \|  else
    \|      exe ":echo 'No identation plugin instaled'"
    \|  endif

"++ COMPILAÇÃO DO CÓDIGO (SEM MAKE): <F8> 
    autocmd VimEnter * 
    \   if exists(":SCCompile") 
    \|      exe "map <F8> :SCCompile<CR>" 
    \|  else
    \|      exe ":echo 'No compiler plugin instaled'"
    \|  endif
    
"++ COMPILAÇÂO E EXECUÇÃO DO CÓDIGO (SEM MAKE): <F9> 
    autocmd VimEnter * 
    \   if exists(":SCCompileRun") 
    \|      exe "map <F9> :SCCompileRun<CR>" 
    \|  else
    \|      exe ":echo 'No compiler plugin instaled'"
    \|  endif

"++ RECARREGAR VIMRC: <F12> 
    au BufNewFile,BufReadPost,Filetype * call Recharge_vimrc() 


"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               FUNÇÕES  
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"++ REDIMENSIONAMENTO DO TERMINAL ++++++++++++++++++++++++++++++++++++++
    " Recebe como parâmetros uma string com o nome de uma função que
    " causa um 'split' na tela, um tamanho para ser adicionado às co-
    " lunas e outro para ser adicionado às linhas. Aumenta o terminal
    " (se possível) para adicionar a nova janela.
    function! Resize(function, col_add_size, lin_add_size)
        " Execute function (avoid terminal changes without
        " charging the function).
        exe "silent " . a:function
        
        " If there were modifications, restore terminal.
        if exists("g:oldcolumn") || exists("g:oldline")
            " Restore terminal to its old size
            let &columns = g:oldcolumn
            let &lines = g:oldline
            " Delete existent variavles
            unlet g:oldcolumn
            unlet g:oldline
        " In other cases, add 'v_size' and 'h_size' to its dimensions.
        else 
            " Saving old size
            let g:oldcolumn = &columns
            let g:oldline   = &lines
            " Modify terminal size
            let &columns = g:oldcolumn + a:col_add_size
            let &lines   = g:oldline + a:lin_add_size
        endif
    endfunction

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

"++ RECARREGAR VIMRC +++++++++++++++++++++++++++++++++++++++++++++++++++
    function! Recharge_vimrc()
        if &term == "win32" || "pcterm" || has("gui_win32")
           map ,v :e $HOME/_vimrc<CR>
           nmap <F12> :<C-u>source ~/_vimrc 
            \ <BAR> echo "Vimrc recarregado!"<CR>
        else
           map ,v :e $HOME/.vimrc<CR>
           nmap <F12> :<C-u>source ~/.vimrc 
            \ <BAR> echo "Vimrc recarregado!"<CR>
        endif
    endfunction
