;;; init_org.el --- Set up Org Mode

;;; Commentary:

;; Basic Org Mode configuration,

;; Helper functions

;;--------------------------------------------------------------------
;; Colour-coding categories in org-mode

(add-hook 'org-finalize-agenda-hook
          (lambda ()
            (save-excursion
              (color-org-header "TODO:" "green")
              (color-org-header "Meetings:" "DarkGreen")
              (color-org-header "Follow-up:" "#00fa9a")
              (color-org-header "Reports:" "blue3")
	      (color-org-header "Tours:" "yellow1")
	      (color-org-header "Annv:" "dark cyan")
	      (color-org-header "mail:" "yellow")
	      (color-org-header "call:" "DeepSkyBlue"))))

(defun color-org-header (tag col)
  ""
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward tag nil t)
    (add-text-properties (match-beginning 0) (point-at-eol)
                         `(face (:foreground ,col)))))

;;=============================================
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	     '("beamer"
	       ,(concat "\\documentclass[presentation]{beamer}\n"
			"[DEFAULT-PACKAGES]"
			"[PACKAGES]"
			"[EXTRA]\n")
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


;;==================================================

;;; Code:
(use-package org
  :ensure t
  :defer t
  :commands (org-capture)
  :config
  (progn
    (global-set-key "\C-cl" 'org-store-link)
    (global-set-key "\C-ca" 'org-agenda)
    (global-set-key "\C-cc" 'org-capture)
    (global-set-key "\C-cb" 'org-iswitchb))
  ;;   (define-key viper-vi-global-user-map "C-c /" 'org-sparse-tree))
  ;; :bind (("C-c l" . 'org-store-link)
  ;;        ("C-c c" . 'org-capture)
  ;;        ("C-c a" . 'org-agenda)
  ;;        ("C-c b" . 'org-iswitchb))
  ;; :config
  (setq org-todo-keywords
	'((sequence "TODO(t)" "FEEDBACK(f)" "VERIFY(v)" "|" "CANCELLED(c@)" "DONE(d@)" "PARTIALLY-DONE(p@)" "DELEGATED(g@)")))
  (setq org-agenda-include-diary t)
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)
  (setq org-indent-mode t)
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
  ;; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)
  ;; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)
  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  ;; Use the current window when visiting files and buffers with ido
  (setq ido-default-file-method 'selected-window)
  (setq ido-default-buffer-method 'selected-window)
  ;; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)
  ;;org-latex
  (require 'ox-latex)
  ;; Listing Package
  (setq org-latex-listings t)
  (add-to-list 'org-latex-packages-alist '("" "listings"))
  (add-to-list 'org-latex-packages-alist '("" "color"))

  (setq org-latex-to-pdf-process
	'("LC_ALL=C PDFLATEX=\"pdflatex –shell-escape\" texi2dvi -p %f"))
  ;;Org to odt export
  (setq org-export-odt-preferred-output-format "odt")
  ;; org v8 bundled with Emacs 24.4
  (setq org-odt-preferred-output-format "odt")

  ;; if evil-mode is present
  (evil-leader/set-key-for-mode 'org-mode
    "$"  'org-archive-subtree
    "a"  'org-agenda
    "d"  'org-deadline
    "ns" 'org-narrow-to-subtree
    "p"  'org-set-property
    "s"  'org-schedule)

  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (setq org-habit-graph-column 50)
              (define-key org-agenda-mode-map "H"          'beginning-of-buffer)
              (define-key org-agenda-mode-map "j"          'org-agenda-next-item)
              (define-key org-agenda-mode-map "k"          'org-agenda-previous-item)
              (define-key org-agenda-mode-map "n"          'org-agenda-next-date-line)
              (define-key org-agenda-mode-map "p"          'org-agenda-previous-date-line)
              (define-key org-agenda-mode-map "R"          'org-revert-all-org-buffers)
              (define-key org-agenda-mode-map "/"          'counsel-grep-or-swiper)
              (define-key org-agenda-mode-map (kbd "RET")  'org-agenda-switch-to)))

  )

;;==================================================
;; Org-babel support

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (emacs-lisp . t)
   ;; (R . t)
   (python . t)))

;;==================================================
(provide 'init_org)
;;; init_org.el ends here
