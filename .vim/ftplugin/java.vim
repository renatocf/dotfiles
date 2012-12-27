"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                 JAVA   
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

augroup java
	au BufNewFile,BufRead,Filetype java set autoindent
	au BufNewFile,BufRead,Filetype java set smartindent
	au BufNewFile,BufRead,Filetype java set shiftround
	au BufNewFile,BufRead,Filetype java set shiftwidth=4
	au BufNewFile,BufRead,Filetype java set copyindent
	au BufNewFile,BufRead,Filetype java set preserveindent
augroup end
