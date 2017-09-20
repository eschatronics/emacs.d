(provide 'slime-config)

;; SLIME Stuff
(use-package slime :ensure t
  :commands (slime)
  :config
  (load "/home/oblivia/quicklisp/clhs-use-local.el" t)
  
  
  (add-hook 'lisp-mode-hook
	    (lambda ()
	      (progn
		(slime-mode t)
		(push '(:eval (format "[%d]" (point))) mode-line-format))))
  
  (add-hook 'slime-mode-hook
	    (lambda ()
	      (progn
		;; So that M-. works in normal mode, too.
		(define-key
		  evil-normal-state-map (kbd "M-.")
		  'slime-edit-definition))))

  (global-set-key (kbd "C-,") 'slime-selector)

  (setq slime-lisp-implementations
	'(
	  (sbcl ("sbcl"))
	  (ccl ("ccl"))
	  ))
  
  (setq slime-contribs '(slime-fancy)
	slime-startup-animation t))
