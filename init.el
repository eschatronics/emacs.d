;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa.org/packages/"))

(use-package which-key :ensure t
	     :init
	     (which-key-mode)
	     :config
	     (which-key-setup-side-window-right-bottom)
	     (setq which-key-sort-order 'which-key-key-order-alpha
		   which-key-side-window-max-width 0.33
		   which-key-idle-delay 0.5))
	     ;:diminish which-key-mode )

(use-package evil :ensure t
	     :init
	     (evil-mode)
	     :config
	     (define-key
		evil-normal-state-map (kbd "u")
		'undo-tree-visualize)
	     )


(use-package ivy :ensure t)

;; SLIME Stuff
(use-package slime :ensure t)

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

(setq inferior-lisp-program "sbcl")

(setq slime-contribs '(slime-fancy))
;;;;

(show-paren-mode) ; highlight delimiters
(line-number-mode) ; display line number in mode line
(column-number-mode) ; display colum number in mode line
(save-place-mode)    ; save cursor position between sessions

(global-auto-revert-mode t)

(global-linum-mode 1)

;; Aesthetics
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (badwolf)))
 '(custom-safe-themes
   (quote
    ("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" default)))
 '(package-selected-packages
   (quote
    (swiper rainbow-mode org-edna badwolf-theme slime ivy which-key general evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
