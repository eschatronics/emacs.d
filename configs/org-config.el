(provide 'org-config)

(require 'ox-latex)
;(unless (boundp 'org-latex-classes)
;  (setq org-latex-classes nil))
(setq org-latex-classes nil)
(add-to-list 'org-latex-classes
	     '("dalthesis"
	       "\\documentclass[12pt]{dalthesis} 
[PACKAGES] 
[EXTRA]
"
	       ("\\chapter{%s}" . "\\chapter*{%s}")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
;	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ;("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}"))
	     
	     '("article"
	       "\\documentclass{article}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(defun olf/org-save-and-export ()
  (interactive)
  (if (eq major-mode 'org-mode)
      (org-latex-export-to-pdf)))

(add-hook 'after-save-hook 'olf/org-save-and-export)

(setq org-agenda-files (list "~/Documents/agenda/CFPs.org"
			     "~/Documents/agenda/research.org"
			     "~/Documents/agenda/misc.org"))
