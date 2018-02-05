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
	  (sbcl ("sbcl" "--dynamic-space-size" "4096"))
	  (ccl ("ccl"))
	  ))
  
  (setq slime-contribs '(slime-fancy)
	slime-startup-animation t))


;;(add-to-list 'load-path "/usr/lib/chicken/8/") ;; where eggs are
;;(autoload 'chicken-slime "chicken-slime" "SWANK backend for chicken" t)
(add-hook 'scheme-mode-hook
          (lambda () (slime-mode t)))
