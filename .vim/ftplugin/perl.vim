"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  PERL
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

"Identação
augroup perl
	au BufNewFile,BufRead,Filetype perl set autoindent
	au BufNewFile,BufRead,Filetype perl set smartindent
	au BufNewFile,BufRead,Filetype perl set shiftround
	au BufNewFile,BufRead,Filetype perl set shiftwidth=4
	au BufNewFile,BufRead,Filetype perl set copyindent
	au BufNewFile,BufRead,Filetype perl set preserveindent
augroup end

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
