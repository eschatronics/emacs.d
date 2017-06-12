(provide 'slime-config)

;; SLIME Stuff
(use-package slime :ensure t
  :commands (slime)
  :config
  (load "/home/oblivia/quicklisp/clhs-use-local.el" t)
  
  
  (add-hook 'lisp-mode-hook
	    (lambda ()
	      (progn
		(slime-mode t))))
  
  (add-hook 'slime-mode-hook
	    (lambda ()
	      (progn
		;; So that M-. works in normal mode, too.
		(define-key
		  evil-normal-state-map (kbd "M-.")
		  'slime-edit-definition))))

  (global-set-key (kbd "C-,") 'slime-selector)
  
  (setq inferior-lisp-program "sbcl"
	slime-contribs '(slime-fancy)
	slime-startup-animation t))
