;; ~/.emacs.d/orgConfig.el
;; configs for org-mode
;; (setq org-completion-use-ido t)
;; (setq ido-everywhere t)
;; (setq ido-max-directory-size 100000)
;; (ido-mode (quote both))
;;--------------------------------------------------------------------
;;copied from the orgmode manual
;;global keys for four Org command

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;--------------------------------------------------------------------
;;TODO keyword to indicate diffrent sequential states
;;@ is for timestamp with notes
;;(character) is to fast access TODO states.

(setq org-todo-keywords '((sequence "TODO(t)" "FEEDBACK(f)" "VERIFY(v)" "|" "CANCELLED(c@)" "DONE(d@)" "PARTIALLY-DONE(p@)" "DELEGATED(g@)")))
;;--------------------------------------------------------------------
;;Include entries from Emacs diary into Org mode's agenda
(setq org-agenda-include-diary t)
(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-indent-mode t)
;;--------------------------------------------------------------------
;; Colour-coding categories in org-mode
;; (setq org-fontify-whole-heading-line t)

(add-hook 'org-finalize-agenda-hook
          (lambda ()
            (save-excursion
              (color-org-header "TODO:" "green")
              (color-org-header "Meetings:" "blue")
              (color-org-header "Follow-up:" "#00fa9a")
              (color-org-header "Reports:" "yellow")
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
;;--------------------------------------------------------------------
;;Org-refile

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
;;--------------------------------------------------------------------
;; Capture templates for: TODO tasks, Notes, Meetings,Follow-up,Reports, phone, Tours,
;; email,and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Org/refile.org")
               "* TODO %?\n%U\n%a\n")
	      ("n" "notes" entry(file "~/Org/refile.org")
	       "* Notes: %?\n%U\n%a\n"))))
;;--------------------------------------------------------------------
;; org-capture

(setq org-default-notes-file "~/Org/refile.org")
;;--------------------------------------------------------------------


;;----------------------------------------------------------------------
;;org-latex
(require 'ox-latex)
;; Listing Package
(setq org-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))

(setq org-latex-to-pdf-process '("LC_ALL=C PDFLATEX=\"pdflatex –shell-escape\" texi2dvi -p %f"))
;; (setq org-latex-to-pdf-process '("PDFLATEX=\"pdflatex –shell-escape\" texi2dvi -p %f"))
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
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; Miketex
(require 'tex-site)
(require 'tex-style)
;; spellcheck in LaTex mode
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)
 
;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)
 
;; highlight current line
(global-hl-line-mode 1)

;; Math mode for LaTex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; activate AUCTEX
(load "auctex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; activate preview-latex
(load "preview.el" nil t t)

;; LaTeX formula images
;; (setq org-latex-create-formula-image-program 'imagemagick)
;; setting up org for org-latex preview
(setq org-latex-create-formula-image-program 'dvipng)

;;----------------------------------------------------------------------
;; Org-babel support
;; (setq exec-path (append exec-path '("C:/Program\ Files/MiKTeX 2.9/miktex/bin/x64")))
;; (load "auctex.el" nil t t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (emacs-lisp . t)
   (org . t)
   (R . t)
   (python . t)))

;;======================================================================
;; Org-Ref
;; (setq reftex-default-bibliography '("D:/bibliography/references.bib"))

;; see org-ref for use of these variables
;; (setq org-ref-bibliography-notes "/D:/bibliography/notes.org"
;;       org-ref-default-bibliography '("D:/bibliography/references.bib")
;;       org-ref-pdf-directory "D:/bibliography/bibtex-pdfs/")

;;If you use helm-bibtex as the citation key completion method you should set these variables too.
;; (setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
;;       bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
;;       bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
;; (setq bibtex-completion-pdf-open-function
;;   (lambda (fpath)
;;     (start-process "open" "*open*" "open" fpath)))

;; (require 'org-ref)
;;======================================================================
;;Org to odt export
(setq org-export-odt-preferred-output-format "odt")
;; org v8 bundled with Emacs 24.4
(setq org-odt-preferred-output-format "odt")
;; BTW, you can assign "pdf" in above variables if you prefer PDF format

;; Only OSX need below setup

;; (defun my-setup-odt-org-convert-process ()
;;   (interactive)
;;   (let ((cmd "/Applications/LibreOffice.app/Contents/MacOS/soffice"))
;;     (when (and (eq system-type 'darwin) (file-exists-p cmd))
;;       ;; org v7
;;       (setq org-export-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i")))
;;       ;; org v8
;;       (setq org-odt-convert-processes '(("LibreOffice" "/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to %f%x --outdir %d %i"))))
;;     ))
;; (my-setup-odt-org-convert-process)
