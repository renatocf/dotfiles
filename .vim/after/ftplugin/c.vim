"///////////////////////////////////////////////////////////////////////
"----------------------------------------------------------------------
"                                   C
"----------------------------------------------------------------------
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

setlocal comments-=://      " exclui // da lista de comentários a
                            " serem repetidos quando a opção syntax on
                            " está ativa.
setlocal comments+=f://     " permite, entretanto, que // seja usado
                            " como comentário caso necessário

"Tags/Completamento para C/C++
source $HOME/.vim/plugin/search_for_tags.vim
call Search_for_tags()

" Para criar novas tags para arquivos:
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

" imap .  .<tab>
" imap -> -><tab>
" imap :: ::<tab>

let OmniCpp_ShowAccess = 1 " +, - e # no menu popup
" let OmniCpp_MayCompleteDot   = 0 " Autocompletar com .
let OmniCpp_MayCompleteArrow = 0 " Autocompletar com ->
let OmniCpp_MayCompleteScope = 0 " Autocompletar com ::
let OmniCpp_NamespaceSearch  = 2 " Procura nos namespaces
let OmniCpp_SelectFirstItem  = 2 " Seleciona primeiro item
let OmniCpp_GlobalScopeSearch = 1 " Procura no âmbito global
let OmniCpp_ShowPrototypeInAbbr = 1 "Protótipos das funções
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Lista de namespaces que não são incluídos com o nome
" da função durante o autocompletamento

" Identação para C
set wrap
set tabstop=2
set expandtab
set linebreak
set textwidth=80
set shiftwidth=2
set softtabstop=2
