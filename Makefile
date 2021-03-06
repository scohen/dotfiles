.PHONY: all emacs-compile elisp-compile deploy

PWD := `pwd`
LINK_CMD := ln --symbolic --force -T
NORMAL_FILES := `ls -I xmonad.hs -I README -I newsbeuterconfig -I vimenv_setup -I Makefile -I pentadactyl -I zathurarc -I ipy_user_conf.py`

refresh:
	 #emacs --batch --no-site-file --eval '(byte-recompile-directory "emacs.d/")'
	 @emacs --batch --no-site-file --eval '(byte-recompile-directory "elisp/")'

all: compile deploy

compile: 
	 #emacs --batch --no-site-file --eval '(byte-recompile-directory "emacs.d/" 0 t)'
	 @emacs --batch --no-site-file --eval '(byte-recompile-directory "elisp/" 0 t)'

deploy:
	@mkdir -p ~/.xmonad
	@mkdir -p ~/.pentadactyl
	@mkdir -p ~/.newsbeuter
	@mkdir -p ~/.config/zathura/
	@for file in $(NORMAL_FILES); do $(LINK_CMD) $(PWD)/$$file ~/.$$file; done
	@$(LINK_CMD) $(PWD)/vimenv_setup ~/.vimrc
	@$(LINK_CMD) $(PWD)/newsbeuterconfig ~/.newsbeuter/config
	@$(LINK_CMD) $(PWD)/xmonad.hs ~/.xmonad/xmonad.hs
	@$(LINK_CMD) $(PWD)/pentadactyl/plugins ~/.pentadactyl/plugins
	@$(LINK_CMD) $(PWD)/pentadactyl/colors ~/.pentadactyl/colors
	@$(LINK_CMD) $(PWD)/zathurarc ~/.config/zathura/zathurarc
	@$(LINK_CMD) $(PWD)/ipy_user_conf.py ~/.ipython/ipy_user_conf.py
