;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (badwolf)))
 '(custom-safe-themes
   (quote
    ("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" default)))
 '(package-selected-packages
   (quote
    (org-ref evil-paredit geiser auctex cider rust-playground rust-mode avy ranger swiper rainbow-mode org-edna badwolf-theme slime ivy which-key general evil use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

	     (setq evil-want-fine-undo 'fine)

	     (define-key
		evil-normal-state-map (kbd "u")
		'undo-tree-visualize)
	     )


(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
         ("C-'" . ivy-avy)) ; C-' to ivy-avy
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )


(use-package ranger :ensure t
  :commands (ranger)
  :bind (("C-x d" . deer))
  :config
  (setq ranger-cleanup-eagerly t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load custom modules ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/langs")
(add-to-list 'load-path "~/.emacs.d/hotkeys")
;;; For SLIME stuff
(require 'slime-config)
;;; for NASL
(require 'nasl-mode)
;; for extra org stuff
(require 'org-config)

(require 'hotkeys)

(require 'linum-config)
;;; Use emacs' own eww browser for browsing the web
(setq browse-url-browser-function 'eww-browse-url)

(require 'mode-line-config)

(show-paren-mode) ; highlight delimiters
(line-number-mode) ; display line number in mode line
(column-number-mode) ; display colum number in mode line
;;(save-place-mode)    ; save cursor position between sessions

(global-auto-revert-mode t)


;; backup files:
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; Aesthetics
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default line-spacing 2) ;; little space between the lines



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBE" :slant normal :weight normal :height 101 :width normal)))))
