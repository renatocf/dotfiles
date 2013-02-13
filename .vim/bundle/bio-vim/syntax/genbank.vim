" Vim syntax file
" Language:     Genbank
" Maintainer:   Johan Viklund <johan.viklund@gmail.com>
" Last Change:  2012 Nov 06

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match gbkDefinition /^[A-Z]*/
syntax match gbkDefinition /^   \?[A-Z]*/

"syntax region gbkFeatureLine start=/^     [a-zA-Z]\+/ end=/$/
"syntax region gbkFeature     start=/^     [a-zA-Z]\+/ end=/^
[a-zA-Z]\+/re=e-9 contains=gbkFeatureAnnotation keepend

"syntax region gbkFeatureAnnotation start=/^                     \/[a-zA-Z_]*/
end=/^                     \/[a-zA-Z_]*/ end=/^     [a-zA-Z]\+/ contained

syntax match gbkFeatureType /^     [a-zA-Z][a-zA-Z]*/ containedin=gbkFeature
syntax match gbkFeatureLocation /\(complement(\)\?<\?\d\+\.\.>\?\d\+)\?/
containedin=gbkFeatureLine

syntax match gbkFeatureAnnotation /^ \+\/[a-zA-Z_]*/

syntax region gbkQuotedString start=/"/ end=/"/

"syntax region gbkFeatureType start=/[^ ]/ end=' '
"syntax match gbkFeatureLocation /[0-9]*/ containedin=gbkFeatureLine

"syntax match gbkDefinition ^LOCUS


highlight link gbkDefinition        Keyword
highlight link gbkFeatureType       Constant
highlight link gbkFeatureLocation   Number
highlight link gbkFeatureAnnotation Identifier

highlight link gbkFeature Comment
highlight link gbkQuotedString Comment


let b:current_syntax = "genbank"
