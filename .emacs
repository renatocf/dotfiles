;;; Lisp (SLIME) interaction 
(setq inferior-lisp-program "clisp") 
(add-to-list 'load-path "~/.slime") 
(require 'slime) 
(slime-setup)
