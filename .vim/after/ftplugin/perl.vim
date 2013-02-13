"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  PERL
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let perl_include_pod = 1 	" inclui pod.vim syntax file
let perl_sync_dist = 250 	" usa mais contexto para colorir
let perl_extended_vars = 1	" colore expressões complexas como 
							" @{[$x, $y]}

"muda cores dos comentários
hi Identifier ctermfg=lightgreen cterm=bold
		
"ativa a opção perl -c com o :make
set makeprg=perl\ -c\ %\ $*
set errorformat=%f:%l:%m
set autowrite
