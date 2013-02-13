" Vim syntax file
" Most of it copied from an unknown source, please let me know if you can find
" it, so credit can be given.
" Language:     General Feature Format
" Maintainer:   Johan Viklund <johan.viklund@gmail.com>
" Last Change:  2012 Nov 06

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match gffDirective /^##.*$/ contains=gffSeq
syntax include @FASTA <sfile>:p:h/fasta.vim
syntax region gffSeq start=/^##FASTA$/rs=e+1 end=+\%$+ contains=@FASTA contained


" These are the different columns in a gff file
" 1 seqid
" 2 source       Program that found the feature
" 3 type         SOFA term (CDS or SO:\d+)
" 4 start        positive int
" 5 end          positive int >= start
" 6 score        float or .
" 7 strand       + -
" 8 phase       . 0 1 2
" 9 attributes

syntax region gffSeqID      matchgroup=gffSeqID      start=+^[^#]+ end=+$+           contains=gffSource     keepend oneline
syntax region gffSource     matchgroup=gffSource     start=+\t+    end=+$+ contained contains=gffType       keepend oneline
syntax region gffType       matchgroup=gffType       start=+\t+    end=+$+ contained contains=gffStart      keepend oneline
syntax region gffStart      matchgroup=gffStart      start=+\t+    end=+$+ contained contains=gffEnd        keepend oneline
syntax region gffEnd        matchgroup=gffEnd        start=+\t+    end=+$+ contained contains=gffScore      keepend oneline
syntax region gffScore      matchgroup=gffScore      start=+\t+    end=+$+ contained contains=gffStrand     keepend oneline
syntax region gffStrand     matchgroup=gffStrand     start=+\t+    end=+$+ contained contains=gffPhase      keepend oneline
syntax region gffPhase      matchgroup=gffPhase      start=+\t+    end=+$+ contained contains=gffAttributes keepend oneline
syntax region gffAttributes matchgroup=gffAttributes start=+\t+    end=+$+ contained keepend oneline


syntax match gffStrandErr +[^+-]+      containedin=gffStrand contained contains=gffPhase
syntax match gffPhaseErr  +[^\.012]+   containedin=gffPhase  contained contains=gffAttributes
syntax match gffStartErr  +[^0-9]+     containedin=gffStart  contained contains=gffEnd
syntax match gffEndErr    +[^0-9]+     containedin=gffEnd    contained contains=gffScore
syntax match gffAttrID    +[A-Z]\S=\++ containedin=gffAttributes contained


highlight link gffDirective Comment
highlight link gffFasta     Comment

highlight link gffSeqID      Identifier
highlight link gffSource     Constant
highlight link gffType       Keyword
highlight link gffStart      Number
highlight link gffEnd        Number
highlight link gffScore      Float
highlight link gffStrand     Operator

highlight link gffPhase      Operator
highlight link gffAttributes Identifier

highlight link gffAttrID     Keyword

highlight link gffStrandErr  Error
highlight link gffPhaseErr   Error
highlight link gffStartErr   Error
highlight link gffEndErr     Error

let b:current_syntax = "gff"
