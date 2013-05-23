DOTFILES por Renato Cordeiro Ferreira
-------------------------------------

Este diretório contém os seguintes arquivos de configurações:
* mercurial: .hgrc;
* bash:      .bashrc e diretório .bash/; 
* git:       .gitignore, .gitignore-global, .gitconfig e .gitmodules;
* vim:       .vimrc, .gvimrc e diretório .vim/; 

### Instalação ###
Para instalar, utilize o Makefile. Basta digitar `make` para 
instalar todas as opções acima. `make clean` faz a desinstalação
e `make update` a atualização dos plugins em submódulos do Vim. 

### Vim + Submódulos ###
Os plugins para vim estão colocados na pasta .vim/bundle e são 
gerenciados pelo plugin [Pathogen][https://github.com/tpope/vim-pathogen], 
também armazenado no mesmo lugar. Para alterar a sua localização, 
basta redefinir o path na opção 'runtime' dentro do vimrc. 
Para mudar o endereço de outros plugins, consulte a documentação do 
[Pathogen][https://github.com/tpope/vim-pathogen].

Todos os plugins utilizados são mantidos com o uso de submódulos, 
cujas propriedades estão salvas no arquivo .gitmodules. Por padrão, 
o git não os inicializa. Para fazê-lo, digite `make vim` para a 
instalação automática ou, manualmente, entre num shell e digite
os comandos `git submodule init` e `git submodule update`. 
Terminados os downloads, os plugins já estarão disponíveis.

#### TagList ####
O plugin [TagList][https://github.com/vim-scripts/taglist.vim] 
depende da instalação do programa cTags. Se este não estiver disponível 
ou não puder ser instalado, basta comentar o alias do plugin no vimrc 
e o gerenciador padrão do vim ficará no lugar dele.
