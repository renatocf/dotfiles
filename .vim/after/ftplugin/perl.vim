"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                  PERL
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let perl_include_pod   = 1   " Include pod.vim syntax file
let perl_sync_dist     = 250 " Use more context to color
let perl_extended_vars = 1   " Color complex expressions like
                             " @{[$x, $y]}

" Change color of variables
hi Identifier ctermfg=lightgreen cterm=bold
