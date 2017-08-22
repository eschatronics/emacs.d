(provide 'org-config)

(require 'ox-latex)
;(unless (boundp 'org-latex-classes)
;  (setq org-latex-classes nil))
(setq org-latex-classes nil)
(add-to-list 'org-latex-classes
	     '("article"
	       "\\documentclass{article}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsetction*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")))
