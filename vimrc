"-----------------------------------------------------------------------
"---------------The following commands were taken from the vimrc example
"----------------------------------------------------------------------

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.


" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark


" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd	" Show (partial) command in status line.
"set showmatch	" Show matching brackets.
"set ignorecase	" Do case insensitive matching
"set smartcase	" Do smart case matching
"set incsearch	" Incremental search
"set autowrite	" Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a	" Enable mouse usage (all modes)


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"----------------------------------------------------------------------
"-------------------------------The following commands were made by me
"----------------------------------------------------------------------


"The following line puts numbers in the beginning of each line
set nu

"TabStop: number of advance characters of TAB
set ts=4


"----------------------------------------------------------------------
"-------------------The following commands were taken from Aurelio.net
"----------------------------------------------------------------------


"..................................INFO
" Guarda posicao do cursor e historico da linha de comando :
set viminfo='10,\"30,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif


"..................................DICIONARIO & ORTOGRAFIA
" Dicionario para procurar o auto-complemento de palavras
"set dictionary=/home/verde/.ispell_br
" Completa uma palavra
imap <F7> <c-n>
" Da a sequencia a essa palavra
imap <F8> <c-x><c-n>
" Procura no dicionario
imap <c-d> <c-x><c-k>
" Passa um spell no arquivo
map <F6> :!spell %<cr>
" Usando o ispell (ademar)
"map <F6> :!ispell -b %^M ^M^M :e ^M :new %.bak ^M <F4> gg
" Ispell no modo visual (miura)
":vmap <F12> <ESC>:w! $HOME/spell.tmp <ESC>:new <ESC>^W15-<ESC>:r !spell $HOME/spell.tmp <ESC>^Wji<ESC>^Wr


".................................ARQUIVO
" Abreviacoes uteis para sua sanidade mental
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq


".................................OUTROS
" Alterna entre janelas sem sair do modo insercao (depois do :split)
map <F5> <esc><c-w><c-w>i
imap <F5> <esc><c-w><c-w>i


".................................PROGRAMAÇÃO
" Python: TAB colorido e outras configuracoes
au FileType python set ts=4 tw=80 noet
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonTAB ctermbg=blue
au FileType python hi pythonString ctermfg=lightgreen
au FileType python hi pythonRawString ctermfg=lightgreen


	" E tem uma dica boa para os programadores de plantão. Comentários num
	" programa são excelentes, ma na hora de sua manutenção, eles podem
	" atrapalhar, pois você queria ver só o código.
	"
	" Para resolver este problema, vamos fazer um  truque no vim. que tal se
	" pintarmos os comentários de preto para que fiquem invisíveis?  podemos
	" fazer isso redefinindo o componente da cor da sintaxe.  ah! e quem usa
	" fundo branco (argh) vai ter que trocar `black` por `white`.
	"
	" E como somos chiques ainda criamos uma função vim pra fazer o serviço.
	" a CommOnOff()  oculta/mostra os comentários, alternando.  o resumão do
	" que ela faz é: se a variável global  'hiddcomm'  não existir, a cria e
	" oculta os comentários. se já existir, restaura os comentários. por fim
	" definimos um mapeamento esperto no F6 para chamar nossa função.
 
fu! CommOnOff()
  if !exists('g:hiddcomm')
    let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
  else
    unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
  endif
endfu
map <F6> :call CommOnOff()<cr>


	" E já que estamos mexendo com a sintaxe, que tal trocar a cor do texto
	" daquela seleção que aparece quando você procura algo com o comando / ?
	" é fácil, basta definir a cor do componente da sintaxe. Ah sim, a opção
	" hls (veja abaixo) deve estar ativa.
	" 
	" você pode colocar as cores que quiser, em inglês. note que é ctermBG e
	" FG, de background e foreground (fundo e letra). E veja  também que o 
	" IncSearch (busca enquanto você digita) é invertido!
	"
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan
