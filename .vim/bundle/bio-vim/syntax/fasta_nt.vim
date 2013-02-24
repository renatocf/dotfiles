" Vim syntax file
" Based on syntax file from http://www.vim.org/scripts/script.php?script_id=2192 (Luis-Miguel Rodriguez <lmrodriguezr@gmail.com>)
" Language:     Fasta (Pearson) (nucleotides)
" Maintainer:   Johan Viklund <johan.viklund@gmail.com>
" Last Change:  2012 Nov 06

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" defline
syn region   defline start=+^>+ end=+\n+ oneline contains=defline_desc,defline_sign,defline_kw
syn match    defline_sign "\(>\||\)" contained
syn match    defline_desc "[^|>]*$" contained
syn keyword  defline_kw gi dbj emb gb gp sp pir ref pdb lcl gnl

" comment
syn region   comment_line start=+^;+ end=+\n+ oneline

" sequence
syn region   seq_line start=+^[^>;]+ end=+\n+ contains=seq_error,seq_sp,seqAmbig
syn match    seq_error +[EFJLOPQZefjlopqz]\|[^A-Za-z*-]+ contained
syn match    seq_sp +[* -]+ contained
syn match    seqAmbig +[RYKMSWBDHVNrykmswbdhvn]+

" [^ARNDCEQGHILKMFPSTWYVarndceqghilkmfpstwyv-]


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_config_syntax_inits")
  if version < 508
    let did_config_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink defline          Special
  HiLink defline_sign     Operator
  HiLink defline_desc     Comment
  HiLink defline_kw       Keyword
  HiLink comment_line     Comment
  HiLink seq_line         String
  HiLink seq_error        Error
  HiLink seq_sp           IncSearch
  HiLink seqAmbig         SpecialChar
  delcommand HiLink
endif

let b:current_syntax = "fasta_nt"

" vim: ts=4