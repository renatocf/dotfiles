DOTFILES por Renato Cordeiro Ferreira
---

Este diretório contém os seguintes arquivos de configurações:
* mercurial: .hgrc;
* bash:      .bashrc e diretório .bash/; 
* git:       .gitignore, .gitignore-global, .gitconfig e .gitmodules;
* vim:       .vimrc, .gvimrc e diretório .vim/; 

### INSTALAÇÃO ###
Para instalar, utilize o Makefile. Basta digitar `make` para 
instalar todas as opções acima. `make clean` faz a desinstalação
e `make update` a atualização dos plugins em submódulos do Vim. 

### Vim + Submódulos ###
Os plugins para vim estão colocados na pasta .vim/bundle e são 
gerenciados pelo plugin pathogen (também em bundle) cujo runtime
está definido no .vimrc. Para alterar a localização desse plugin,
basta alterar o path do runtime. Para mudar a localização dos 
outros plugins, consultar a documentação do pathogen.

Todos os plugins citados acima foram criados com submódulos, 
os quais estão salvos no arquivo .gitsubmodule. Por padrão, o 
git não os inicializa. Para fazê-lo, basta entrar na pasta 
home e digitar, num shell, os comandos:
    git submodule init
    git submodule update
Assim que terminar de fazer os downloads, os plugins estarão
disponíveis.

#### TagList ####
O plugin TagList depende da instalação do programa cTags. Se este
não estiver disponível ou não puder ser instalado, basta comentar
o alias do plugin no .vimrc e o gerenciador padrão do vim ficará
disponível com o mesmo comando.
