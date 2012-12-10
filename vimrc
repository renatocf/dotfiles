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
	set nu		  " Números no início das linhas
	set ts=4	  " Tamanho da tabulação: 4 espaços
	set shiftwidth=4  " Identação com 4 espaços de tabulação
	set textwidth=72  " Tamanho máximo da largura das linhas: 72 
			  " espaços (coisas de cartões perfurados...)
	set autowrite	  " Salva automaticamente antes de :next e :make

"++ PESQUISA +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	set diffopt=filler,iwhite	" Ignorar espaços em branco
	set hlsearch			" highlight the search
	set incsearch			" Pesquisa enquanto digita
	set ignorecase			" Procurar ignorando diferenças 
					" maiúsculas/minúsculas

"++ IDENTAÇÃO AUTOMÁTICA (C, C++ E JAVA) +++++++++++++++++++++++++++++++
augroup c
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set autoindent
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set smartindent 
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set shiftround 
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set shiftwidth=4 
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set copyindent 
	au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java set preserveindent
augroup end

"++ POSIÇÃO DO CURSOR +++++++++++++++++++++++++===++++++++++++++++++++++
" Guarda posicao do cursor e historico da linha de comando :
set viminfo='10,\"30,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif



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
iab _MAIS_MENOS_	±
iab _TENSORIAL_		⊗
iab _SOMA_DIRETA_	⊕

"---- LÓGICA
iab _PARA_TODO_ 	∀
iab _EXISTE_ 		∃
iab _NAO_		¬
iab _E_			∧
iab _OU_		∨
iab _PORTANTO_ 		∴
iab _PORQUE_ 		∵
iab _IMPLICA_		→
iab _SE_SO_SE_		↔

"---- COMPARAÇÃO
iab _DIFERENTE_		≠
iab _APROX_		≈
iab _CONGRUENTE_	≅
iab _EQUIVALENTE_	≡
iab _MAIOR_IGUAL_	≥
iab _MENOR_IGUAL_	≤

"---- CÁLCULO
iab _FUNCAO_COMP_	∘
iab _INFINITO_		∞
iab _DIFERENCIAL_	∂
iab _GRADIENTE_		∇
iab _INTEGRAL_		∫
iab _INTEG_LINHA_ 	∮
iab _SOMATORIO_		∑
iab _PRODUTORIO_	∏

"---- CONJUNTOS
iab _VAZIO_		∅
iab _NATURAIS_		ℕ
iab _INTEIROS_		ℤ
iab _RACIONAIS_		ℚ
iab _REAIS_		ℝ
iab _COMPLEXOS_		ℂ

"---- CONJUNTÍSTICA
iab _PERTENCE_		∈
iab _NAO_PERTENCE_	∉
iab _CONTEM_		⊇
iab _CONTEM_DIF_	⊃
iab _CONTIDO_		⊆
iab _CONTIDO_DIF_	⊂
iab _UNIAO_		U
iab _INTER_		∩

"---- ÁLGEBRA LINEAR
iab _ORTOGONAL_		⊥
iab _PROD_INTERNO_	⟨⟩



"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                               MAPEAMENTOS
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


"Os seguintes mapeamentos estão listados nesta seção:
"
"	|-------------------------------------------|
"	| LEGENDA:				    |
"	| (I) Funciona no modo de inserção	    |
"	| (V) Funciona no modo visual		    |
"	| (A) Funciona nos modos normal e visual    |
"	|-------------------------------------------|
"
"	<S-TAB>:	(I) Completa uma palavra
"	<C-S-TAB>:	(I) Dá sequência a uma palavra
"	<C-D>:		(I) Procura no dicionário
"
"	<F3>: (A) 	janela de erros do comando :make
"	<F4>: (A) 	janela de navegação em pastas
"	<F5>: (A/I) troca de buffers (para múltiplas janelas abertas)
"	<F6>: (A) 	esconde/revela os comentários
"	<F7>: (V) 	comenta na forma C-ansi (para .c, .cpp e .java) 
"		  (V) 	comenta na dorma de Perl (para .pl ou .perl)
"	<F8>: (v) 	descomenta na forma C-ansi (para .c, .cpp e .java) 
"		  (V) 	descomenta na dorma de Perl (para .pl ou .perl)
"	<F9>: (I) 	liga/desliga identação automática
"	
"	<S-F7>: (V) comenta na forma C++ (para .cpp e .java)
"	<S-F8>: (V) descomenta na forma C++ (para .cpp e .java)


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ DICIONÁRIO/ORTOGRAFIA E AUTOCOMPLETAMENTO ++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	set dictionary=/home/verde/.ispell_br
	" Dicionario para procurar o auto-complemento de palavras
	imap <s-tab> <c-n>		" Completa uma palavra
	imap <c-s-tab> <c-x><c-n>	" Da a sequência a essa palavra
	imap <c-d> <c-x><c-k>		" Procura no dicionario


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ CORRETOR/COMPILADOR PARA ERROS (:make): <F3> ++++++++++++++++++++++*
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	"Abre janela com lista de erros do :make
	map <F3> <esc>:vertical botright 30 cwindow<cr> <BAR> :echo "Make errors"<cr><esc>
	map cn <esc>:cn<cr>	"Move cursos ao próximo erro do :make
	map cp <esc>:cp<cr>	"Move cursor ao erro anterior do :make


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ FILE EXPLORER: <F4> e ALTERNAR JANELAS: <F5> ++++++++++++++++++++++*
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	" Abrir File Explorer
	map <F4> <esc><c-w>v<F5>:e.<cr>
	" Alterna entre janelas sem sair do modo normal (depois do :split)
	map <F5> <c-w><c-w>
	" Alterna janelas sem sair do modo de inserção (depois do :split)
	imap <F5> <esc><c-w><c-w>i


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ ESCONDER COMENTÁRIOS: <F6> PARA TODOS OS MODOS ++++++++++++++++++++*
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	" E como somos chiques ainda criamos uma função vim pra fazer o 
	" serviço a CommOnOff() oculta/mostra os comentários, alternando.
	" O resumão do que ela faz é: se a variável global 'hiddcomm' não 
	" existir, a cria e oculta os comentários. se já existir, restaura 
	" os comentários. Por fim definimos um mapeamento esperto no F6 para
	" chamar nossa função.

	fu! CommOnOff()
	  if !exists('g:hiddcomm')
		let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
	  else
		unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
	  endif
	endfu
	map <F6> :call CommOnOff()<cr>


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ COMENTÁRIOS C-ANSI (/* e */): <F7> e <F8> NO MODO VISUAL +++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	augroup c
		" Comenta código C, C++ e Java com estiloo C-ansi (/* e */)
		au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java vmap <F7> :s/\/\*/\\%/e<cr><c-v>gv:s/\*\//%\\/e<cr><c-v>gvI/*<esc><c-v>gv$A*/<esc>:let @/=""<CR><esc>:echo " Comment"<CR>
		" O comando acima retira os comentários C-ansi (/* e */) e os
		" transforma em \% e %\ (sem valor para a linguagem C). Em se-
		" guida, coloca /* e */ no início e no fim do bloco.

		" Descomenta código C, C++ e Java com estilo C-ansi (/* e */)
		au BufNewFile,BufRead,Filetype *.c,*.cpp,*.java vmap <F8> :s/\*\///e<cr><c-v>gv:s/\/\*//e<cr><c-v>gv:s/\\%/\/\*/e<cr><c-v>gv:s/%\\/\*\//e<cr>:let @/=""<CR><esc>:echo " Uncomment"<CR>
		" Retira /* e */ colocados no comando acima e transforma os 
		" caracteres \% e %\ criados por ele de volta em /* e */, 
		" devolvendo o código original.
	augroup end


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ COMENTÁRIOS PERL (#): <F7> e <F8> NO MODO VISUAL +++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	augroup perl
		"Comenta código Perl com comentários #
		au BufNewFile,BufRead,Filetype *.pl,*.perl vmap <F7> :s/^/#/gi<cr>:let @/=""<CR><esc>:echo " Comment"<CR>
		
		"Descomenta código Perl com comentários #
		au BufNewFile,BufRead,Filetype *.pl,*.perl vmap <F8> :s/^#//gi<cr>:let @/=""<CR><esc>:echo " Uncomment"<CR>
	augroup end


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ IDENTAÇÃO AUTOMÁTICA: <F9> NO MODO DE INSERÇÃO +++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	" Liga/desliga a identação automática no modo de inserção
	imap <F9> <esc>:set autoindent!<cr>:set smartindent!<cr>:set shiftround!<cr>:set shiftwidth=4<cr>:set copyindent!<cr>:set preserveindent!<cr>i<right>


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ RECARREGAR VIMRC: <F12> ++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Permite recarregar o vim para que modificações no
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
   map ,v :e $HOME/_vimrc<CR>
   nmap <F12> :<C-u>source ~/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
   map ,v :e $HOME/.vimrc<CR>
   nmap <F12> :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++ COMENTÁRIOS C++ (//): <S-F7> e <S-F8> NO MODO VISUAL +++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	augroup c++
		"Comenta código C++ e Java com comentários de estilo C++
		au BufNewFile,BufRead,Filetype *.cpp,*.java vmap <S-F7>	:s/^/\/\//gi<cr>:let @/=""<CR><esc>:echo " Comment"<CR>
		
		"Descomenta código C++ e Java com comentários de estilo C++
		au BufNewFile,BufRead,Filetype *.cpp,*.java vmap <S-F8> :s/^\/\///gi<cr>:let @/=""<CR><esc>:echo " Uncomment"<CR>
	augroup end



"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                COLORAÇÃO 
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


"++ FUNDO ESCURO +++++++++++++++++++++++++++++++++++++++++++++++++++++++
set background=dark

"++ PYTHON +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Python: TAB colorido e outras configuracoes
au FileType python set ts=4 tw=80 noet
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonTAB ctermbg=blue
au FileType python hi pythonString ctermfg=lightgreen
au FileType python hi pythonRawString ctermfg=lightgreen

"++ PESQUISA +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan