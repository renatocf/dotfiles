## PROGRAMS ###########################################################
RM    := rm -f
MV    := mv -vi
GIT   := git
MKDIR := mkdir -p

## FILES ##############################################################
OLD      := .old
HOME     := ~
CONFIGS  := vim bash git hg 
DOTFILES := git@github.com:renatocf/dotfiles.git

## BUILD ##############################################################
.PHONY: all
all: $(CONFIGS) | dotfiles
	$(GIT) remote add origin $(DOTFILES)

dotfiles:
	$(GIT) clone $(DOTFILES)

.PHONY: vim
vim: $(shell .*vim*) | plugins
	$(MV) $^ $(HOME)

.PHONY: plugins
plugins: .gitmodules
	$(MV) $< $(HOME)
	$(GIT) submodule init
	$(GIT) submodule update
	
.PHONY: bash
bash: $(shell ls .bash* .profile*)
	$(MV) $^ $(HOME)
	
.PHONY: git
git: $(shell ls .git*)
	$(MV) $^ $(HOME)
	
.PHONY: hg
hg: $(shell .hg*)
	$(MV) .hgrc $(HOME)

.PHONY: clean
clean:
	$(RM) $(addprefix $(HOME)/,$(shell .hg* .git* .bash* .profile* .*vim*))
	$(MV) $(OLD)/* $(HOME)

.PHONY: update
update:
	$(GIT) pull origin master
	$(GIT) submodule foreach $(GIT) update
	. .bashrc
	
## BACKUP #############################################################
.%: | $(OLD)
	$(MV) $@ $(OLD)/$@~

$(OLD):
	$(MKDIR) $@
