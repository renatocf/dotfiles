## PROGRAMS ###########################################################
MV  := mv -vi
GIT := git

## FILES ##############################################################
HOME     := ~
CONFIGS  := vim bash git hg 
DOTFILES := git@github.com:renatocf/dotfiles.git

## BUILD ##############################################################
.PHONY: all
all: $(CONFIGS) | dotfiles

dotfiles:
	$(GIT) clone $(DOTFILES)

.PHONY: vim
vim: 
	$(MV) .vim $(HOME)
	$(MV) .vimrc .gvimrc $(HOME)
	$(MV) .gitmodules $(HOME)
	$(GIT) submodule init
	$(GIT) submodule update
	
.PHONY: bash.
bash:
	$(MV) .bash $(HOME)
	$(MV) .bashrc $(HOME)
	$(MV) .profile $(HOME)
	
.PHONY: git
git:
	$(MV) .gitconfig $(HOME)
	$(MV) .gitignore* $(HOME)
	
.PHONY: hg
hg:
	$(MV) .hgrc $(HOME)
