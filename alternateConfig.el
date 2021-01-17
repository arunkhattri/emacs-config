(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 110))
(global-set-key (kbd "RET") 'newline-and-indent) ; automatically indent when press RET
;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; linum-mode in all programming modes
(add-hook 'prog-mode-hook 'linum-mode)

(setq calendar-latitude 28.6)
(setq calendar-longitude 77.2)
(setq calendar-location-name "New Delhi, India")
;; Time-Zone for New Delhi
(setq calendar-time-zone +530)
(setq calendar-standard-time-zone-name "IST")

(set-language-environment "UTF-8")
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Auto wrap at 80 characters
(setq-default auto-fill-function 'do-auto-fill)
(setq-default fill-column 78)
(turn-on-auto-fill)

;; Disable auto-fill-mode in programming mode
(add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))

(setq-default abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs 'silent)

(use-package paren
  :init
  (setq show-paren-style 'mixed)
  :config
  (show-paren-mode t))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(defalias 'list-buffers 'ibuffer)

(use-package ace-window
:ensure t
:init
(progn
(setq aw-scope 'frame)
(global-set-key (kbd "C-x O") 'other-frame)
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
  ))

(defface my-pl-segment1-active
  '((t (:foreground "#000000" :background "#E1B61A")))
  "Powerline first segment active face.")
(defface my-pl-segment1-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline first segment inactive face.")
(defface my-pl-segment2-active
  '((t (:foreground "#F5E39F" :background "#8A7119")))
  "Powerline second segment active face.")
(defface my-pl-segment2-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline second segment inactive face.")
(defface my-pl-segment3-active
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment active face.")
(defface my-pl-segment3-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment inactive face.")

(defun air--powerline-default-theme ()
  "Set up my custom Powerline with Evil indicators."
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (seg1 (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
                          (seg2 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
                          (seg3 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)
                                         ))
                                     (if evil-mode
                                         (funcall separator-left (powerline-evil-face) seg1))
                                     (powerline-buffer-id seg1 'l)
                                     (powerline-raw "[%*]" seg1 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format seg1 'l))
                                     (powerline-raw " " seg1)
                                     (funcall separator-left seg1 seg2)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object seg2 'l))
                                     (powerline-major-mode seg2 'l)
                                     (powerline-process seg2)
                                     (powerline-minor-modes seg2 'l)
                                     (powerline-narrow seg2 'l)
                                     (powerline-raw " " seg2)
                                     (funcall separator-left seg2 seg3)
                                     (powerline-vc seg3 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) seg3 'l))))
                          (rhs (list (powerline-raw global-mode-string seg3 'r)
                                     (funcall separator-right seg3 seg2)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) seg2 'l))
                                     (powerline-raw "%4l" seg2 'l)
                                     (powerline-raw ":" seg2 'l)
                                     (powerline-raw "%3c" seg2 'r)
                                     (funcall separator-right seg2 seg1)
                                     (powerline-raw " " seg1)
                                     (powerline-raw "%6p" seg1 'r)
                                     (when powerline-display-hud
                                       (powerline-hud seg1 seg3)))))
                     (concat (powerline-render lhs)
                             (powerline-fill seg3 (powerline-width rhs))
                             (powerline-render rhs)))))))

(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (if (display-graphic-p) 'arrow
                                      nil))
  (air--powerline-default-theme))

(use-package powerline-evil
  :ensure t)

;; parts taken from https://github.com/tuhdo/emacs-c-ide-demo/blob/master/custom/setup-ivy-counsel.el
(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-c r" . counsel-recentf)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))
(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

;; https://github.com/sejdemyr/.emacs.d/blob/master/init.el
;; validate options
(use-package validate
  :ensure t
  :init
  (use-package seq
    :ensure t))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-c C-r" . ivy-resume))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'elfeed-show-mode)
  (add-to-list 'evil-emacs-state-modes 'go-mode)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
;;  (use-package evil-jumper
;;    :ensure t
;;    :config
;;    (global-evil-jumper-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-indent-textobject
    :ensure t))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setenv "GIT_ASKPASS" "git-gui--askpass")

  (defun magit-insert-remote-header ()
    "Insert a header line about the remote of the current branch."
    (-when-let (remote (or (magit-get-remote)
                           (let ((remotes (magit-list-remotes)))
                             (or (car (member "origin" remotes))
                                 (car remotes)))))
      (magit-insert-section (remote remote)
        (magit-insert
         (concat (format "%-10s" "Remote: ")
                 (propertize remote 'face 'magit-branch-remote) " "
                 (magit-get "remote" remote "url") "\n")))))
  )

(setq path-to-ctags "/usr/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))

(setq elfeed-db-directory "~/Dropbox/orgFiles/elfeed")

;;============================================================
;; Helper Functions
;;============================================================

;; Ref: http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/

(defun akk/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))
(defun akk/elfeed-show-python ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-python"))
(defun akk/elfeed-show-news ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-news"))
(defun akk/elfeed-show-emacs ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-emacs"))
(defun akk/elfeed-show-golang ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-golang"))
(defun akk/elfeed-show-dataAnalysis ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-dataAnalysis"))
(defun elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))

;;============================================================
;; Sync elfeed between machines
;; makes sure that elfeed reads index from disk before launching
;;============================================================

(defun akk/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun akk/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

;;============================================================
;; using hydra for navigation
;;============================================================
;; Ref: http://cestlaz.github.io/posts/using-emacs-30-elfeed-2/#.W58qdS0zbeQ

(defhydra akk/hydra-elfeed ()
  "filter"
  ("E" (elfeed-search-set-filter "@6-months-ago +emacs") "elfeed-emacs")
  ("P" (elfeed-search-set-filter "@6-months-ago +python") "elfeed-python")
  ("g" (elfeed-search-set-filter "@6-months-ago +golang") "elfeed-golang")
  ("N" (elfeed-search-set-filter "@6-months-ago +news") "elfeed-news")
  ("D" (elfeed-search-set-filter "@6-months-ago") "elfeed-dataAnalysis")
  ("A" (elfeed-search-set-filter "@6-months-ago") "elfeed-all")
  ("T" (elfeed-search-set-filter "@1-day-ago") "Today")
  ("Q" akk/elfeed-save-db-and-bury "Quit Elfeed" :color blue)
  ("q" nil "quit" :color blue)
  ("c" nil "cancel")
  )

;;============================================================
;; Configure elfeed
;;============================================================

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
              ("q" . akk/elfeed-save-db-and-bury)
              ("Q" . akk/elfeed-save-db-and-bury)
              ("j" . akk/hydra-elfeed/body)))

;;============================================================
;; use an org file to organise feeds
;;============================================================
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/Dropbox/orgFiles/elfeed/elfeed.org")))

;;============================================================
;; elfeed goodies
;;============================================================
(use-package elfeed-goodies
  :ensure t
  :config(elfeed-goodies/setup))

(use-package company
  :diminish ""
  :init
  ;; (add-hook 'prog-mode-hook 'company-mode)
  ;; (add-hook 'comint-mode-hook 'company-mode)
  :config
  (global-company-mode 1)
  ;; Quick-help (popup documentation for suggestions).
  ;; Company settings.
  (setq company-tooltip-limit 10
        ;; company-idle-delay 0.2
        company-idle-delay 0.0  ;; for lsp
        company-echo-delay 0
        ;; company-minimum-prefix-length 2
        company-minimum-prefix-length 1  ;; for lsp
        company-require-match nil
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  ;; weight by frequency
  (setq company-transformers '(company-sort-by-occurrence))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))
  ;; prevent company from completing on its own when we type regular characters
  ;; (define-key company-active-map (kbd "SPC") nil)

  (use-package company-quickhelp
    :ensure t
    :init (company-quickhelp-mode 1))
  (use-package company-web
    :ensure t
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))
(use-package company-lsp
  :ensure t
  :config
  (setq company-lsp-enable-snippet t
        company-lsp-async t
        company-transformers nil
        company-lsp-cache-candidates 'auto)
  (push 'company-lsp company-backends))

(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))

(use-package python-mode
  :ensure t
  :config
  ;; (add-hook 'python-mode-hook 'electric-pair-mode)
  (yas-reload-all)
  (add-hook 'python-mode-hook 'yas-minor-mode)
  (add-hook 'python-mode-hook (lambda () (auto-complete-mode -1)))
  (setq-default py-split-windows-on-execute-function 'split-window-horizontally)
  :bind (:map python-mode-map
             ("C-c C-r" . py-execute-region)
             ("C-c C-l" . py-execute-line)))

(use-package lsp-mode
  :hook
  (python-mode . lsp-deferred)
  (go-mode . lsp-deferred)
  :custom
  (lsp-auto-guess-root nil)
  (lsp-prefer-capf t)
  (lsp-prefer-flymake nil)
  :commands
  (lsp-deferred))


(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit t)
  ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp))))
;; (setq lsp-python-ms-executable
;;       "/home/arunkhattri/github/python-language-server/output/bin/Release/")

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1)
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  )

;;; golang --- Summary
;;; Commentary:
;;; configuration for go-mode
;;; code:
(use-package go-mode
  :ensure t
  :bind (:map go-mode-map
              ("C-," . 'akk/hydra-go/body))
  :config
  (add-hook 'go-mode-hook 'lsp-deferred)
    ;; (setq gofmt-command "goimports")
    ;; ;; not needed after lsp and gopls [Apr 26, 2020]
    ;; (add-hook 'before-save-hook 'gofmt-before-save)
  (setq compile-command "go build -v && go test -v && go vet")
  (setq lsp-gopls-staticcheck t)
  (setq lsp-eldoc-render-all t)
  (setq lsp-gopls-complete-unimported t))

;; lsp related settings
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; ;; Gopls configuration
(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)
   ("gopls.deepCompletion" t t)))

(use-package yasnippet
  :ensure t
  :init (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (setq yas-snippet-dirs
        '("/home/arunkhattri/.emacs.d/snippets/"                            ;; personal snippets
          "/home/arunkhattri/go_projects/src/github.com/yasnippet-go"               ;; go snippets
          ;; "~/.emacs.d/elpa/yasnippet-snippets-[:digit:]+.[:digit:]+/snippets"
          "/home/arunkhattri/.emacs.d/elpa/yasnippet-snippets-20200425.1210/snippets"
          ))
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(add-hook 'prog-mode-hook
      (lambda ()
        (font-lock-add-keywords nil '(("\\<\\(AKK\\|FIXME\\|TODO\\|BUG\\):" 1
                       font-lock-warning-face t)))))

(require 'epa)
(epa-file-enable)

(defvar mode-line-cleaner-alist
  `((company-mode . " α")
    (elpy-mode . " Elp")
    (ivy-mode . "")
    (undo-tree-mode . "")
    (yas/minor-mode . " υ")
    (paredit-mode . " π")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (flycheck-mode . " FC")
    (projectile-mode . " PJT")
    ;; Major modes
    (lisp-interaction-mode . "λ")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "EL")
    (nxhtml-mode . "nx"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; alias the new `flymake-report-status-slim' to
;;; `flymake-report-status'
(defalias 'flymake-report-status 'flymake-report-status-slim)
(defun flymake-report-status-slim (e-w &optional status)
  "Show \"slim\" flymake status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " Φ"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line mode-line)
    (force-mode-line-update)))

;; (use-package web-mode
;;     :ensure t
;;     :config
;;     (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;     (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
;;     (setq web-mode-engines-alist
;;       '(("django"    . "\\.html\\'")))
;;     (setq web-mode-ac-sources-alist
;;       '(("css" . (ac-source-css-property))
;;       ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
;;       ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
;;     (setq web-mode-css-indent-offset 2)
;;     (setq web-mode-code-indent-offset 2)
;;     (setq web-mode-attr-indent-offset 2)
;;     (setq web-mode-enable-auto-closing t)
;;     (setq web-mode-enable-auto-pairing t)
;;     (setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
;;     (defun my-web-mode-hook ()
;;       "Hooks for Web mode."
;;       (setq web-mode-markup-indent-offset 2))
;;     (add-hook 'web-mode-hook  'my-web-mode-hook)
;;     ;; Left Padding
;;     (setq web-mode-style-padding 1)
;;     (setq web-mode-script-padding 1)
;;     (setq web-mode-block-padding 0)
;;     ;; syntax highlight
;;     (set-face-attribute 'web-mode-css-at-rule-face nil :foreground "Pink3")
;;     ;; auto-pairing
;;     (setq web-mode-enable-auto-pairing t)
;;     ;; css colorization
;;     (setq web-mode-enable-block-face t)
;;     ;; highlight the current column
;;     (setq web-mode-enable-current-column-highlight t)
;;     )

;;; Configuration for editing html, js and css
(use-package company-tern
  :ensure t)

(use-package js2-refactor
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
  ;; unbind it.
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook 'js2-mode-hook (lambda ()
    (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  )

(use-package xref-js2
  :ensure t)

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'". js2-mode))
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda ()
                             (tern-mode)
                             (company-mode)))
  ;; disable completion keybindings, as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)
  )

(use-package web-mode
  :mode ("\\.html$" . web-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  (setq web-mode-engines-alist
  '(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
  ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq js-indent-level 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-closing t)
  ;; (add-hook 'web-mode-hook 'electric-pair-mode)
  (setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
  :config
    (defun my-web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2))
      (add-hook 'web-mode-hook  'my-web-mode-hook)
      (add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
          (let ((web-mode-cur-language
                  (web-mode-language-at-pos)))
                  (if (string= web-mode-cur-language "php")
              (yas-activate-extra-mode 'php-mode)
              (yas-deactivate-extra-mode 'php-mode))
                  (if (string= web-mode-cur-language "css")
              (setq emmet-use-css-transform t)
              (setq emmet-use-css-transform nil)))))
      (defun my-web-mode-hook ()
      (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
      ))



(use-package web-beautify
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))


(defun surround-html (start end tag)
   "Wraps the specified region (or the current 'symbol / word'
 with a properly formatted HTML tag."
   (interactive "r\nsTag: " start end tag)
   (save-excursion
     (narrow-to-region start end)
     (goto-char (point-min))
     (insert (format "<%s>" tag))
     (goto-char (point-max))
     (insert (format "</%s>" tag))
     (widen)))

;; (define-key html-mode-map (kbd "C-c C-w") 'surround-html)

(use-package emmet-mode
  :diminish (emmet-mode . "ε")
  :bind* (("C-)" . emmet-next-edit-point)
          ("C-(" . emmet-prev-edit-point)
          ("C-j" . emmet-expand-line))
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point
             emmet-expand-line)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))


(use-package nginx-mode
  :commands (nginx-mode))


(use-package json-mode
  :mode "\\.json\\'"
  :config
  (bind-key "{" #'paredit-open-curly json-mode-map)
  (bind-key "}" #'paredit-close-curly json-mode-map))

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy))

;; (use-package helm-projectile
;;   :init
;;   (helm-projectile-on)
;;   (setq projectile-completion-system 'helm)
;;   (setq projectile-indexing-method 'alien)
;;   :bind
;;   ("M-t" . helm-projectile-find-file))

(use-package cython-mode
  :ensure t
  :mode (("\\.py[xdi]" . cython-mode)))

(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
;; (add-to-list 'load-path
;;              (expand-file-name "~/.emacs.d/e/ledger/source/lisp/"))
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(global-set-key (kbd "C-c I") 'irc)
(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
     :channels ("#rcirc" "#emacs" "#emacswiki"))))

;; This code adds smileys such as :) and :( to rcirc.

(eval-after-load 'rcirc
  '(add-to-list 'rcirc-markup-text-functions 'rcirc-smileys))

(defun rcirc-smileys (&rest ignore)
  "Run smiley-buffer on the buffer
but add a temporary space at the end to ensure matches of smiley
regular expressions."
  (goto-char (point-max))
  (insert " ")
  (smiley-buffer)
  (delete-char -1))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

;; default
(setq mu4e-maildir "~/Dropbox/Maildir")

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Gmail addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
    '( ("/INBOX" . ?i)
       ("/[Gmail].Sent Mail" . ?s)
       ("/[Gmail].Trash" . ?t)
       ("/[Gmail].All Mail" . ?a)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 300)

;; something about ourselves
(setq
   user-mail-address "arun.kr.khattri@gmail.com"
   user-full-name  "Arun Kr. Khattri"
   mu4e-compose-signature
    (concat
      "With regards\n"
      "Arun Kr. Khattri\n\n\n"
      "An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.\n"
      " *********************************************************************************\n"
      " This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the system manager. This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. If you are not the intended recipient you are notified that disclosing, copying, distributing or taking any action in reliance on the contents of this information is strictly prohibited . The information contained in this mail is propriety and strictly confidential.\n"
      " *********************************************************************************\n"
      " CONFIDENTIALITY NOTICE This e-mail message and any attachments are only for the use of the intended recipient and may contain information that is privileged, confidential or exempt from disclosure under applicable law. If you are not the intended recipient, any disclosure, distribution or other use of this e-mail message or attachments is prohibited. If you have received this e-mail message in error, please delete and notify the sender immediately. Thank you.\n"))

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

;; (require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;    starttls-use-gnutls t
;;    smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;    smtpmail-auth-credentials
;;    (expand-file-name "~/.authinfo.gpg")
;;    smtpmail-default-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-service 587)
(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      user-full-name "Arun Kr. Khattri")

(setq message-sendmail-envelope-from 'header)


;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; Displaying rich-text messages
(add-hook 'mu4e-view-mode-hook
  (lambda()
    ;; try to emulate some of the eww key-bindings
    (local-set-key (kbd "<tab>") 'shr-next-link)
    (local-set-key (kbd "<backtab>") 'shr-previous-link)))

;; using dark-theme, change the luminosity
(setq shr-color-visible-luminance-min 80)
;; save message
(defun djcb-mu4e-copy-message-at-point (&optional dir)
  "Copy message at point to somewhere else as <date>_<subject>.eml."
  (interactive)
  (let* ((msg (mu4e-message-at-point))
         (target (format "%s_%s.eml"
                         (format-time-string "%F" (mu4e-message-field msg :date))
                         (or (mu4e-message-field msg :subject) "No subject"))))
    (copy-file
     (mu4e-message-field msg :path)
     (format "%s/%s" (or dir (read-directory-name "Copy message to: ")) target) 1)))

;;; Code:
(use-package org
:ensure t
:defer t
:commands (org-capture)
:config
(setq org-hide-emphasis-markers t)
(setq org-image-actual-width nil)
(setq org-emphasis-alist
      '(("*" (bold :foreground "yellow"))
        ("/" (italic :foreground "green"))
        ("_" (underline :background "maroon" :foreground white))
        ("=" org-verbatim verbatim)
        ("~" (:foreground "#ff7f50"))
        ("+" (:strike-through t))))
      ;; (quote (("*" (:foreground "yellow" :bold t))
      ;;         ;; ("/" italic)
      ;;         ("/" (:foreground "green" :italic t))
      ;;          ;; ("_" underline)
      ;;         ("_" (:background "maroon" :foreground "white" :underline t))
      ;;         ("=" org-verbatim verbatim)
      ;;         ("~" org-code verbatim)
      ;;         ("+" (:strike-through t)))))
:bind (("\C-cl" . org-store-link)
       ("\C-ca" . org-agenda)
       ("\C-cc" . org-capture)
       ("\C-cw" . org-refile)
       ("\C-cb" . org-iswitchb)
       ("\C-c!" . org-time-stamp-inactive)))
    ;;   (define-key viper-vi-global-user-map "C-c /" 'org-sparse-tree))
    ;; :bind (("C-c l" . 'org-store-link)
    ;;        ("C-c c" . 'org-capture)
    ;;        ("C-c a" . 'org-agenda)
    ;;        ("C-c b" . 'org-iswitchb))
    ;; :config
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    (custom-set-variables
    ' (org-hide-leading-stars t)
    ' (org-startup-folded (quote overview))
    ' (org-startup-indented t)))
(setq org-todo-keywords
        '((sequence "TODO(t)" "IN-PROCESS(p)" "ON-HOLD(h)" "|" "CANCELLED(c@)" "DONE(d@)" "PARTIALLY-DONE(p@)" "DELEGATED(g@)")))
(setq org-agenda-include-diary t)

(setq org-indent-mode t)
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9))))

;; =======================================================================
;; Function to choose where a captured entry will go
;; No more working as on Sep 16, 2018
;; https://emacs.stackexchange.com/questions/5923/org-capture-how-to-choose-the-target-file-at-the-end-of-the-process
;; (defun org-get-target-headline (&optional targets prompt)
;;  "Prompt for a location in an org file and jump to it.

;; This is for promping for refile targets when doing captures.
;; Targets are selected from `org-refile-targets'. If TARGETS is
;; given it temporarily overrides `org-refile-targets'. PROMPT will
;; replace the default prompt message.

;; If CAPTURE-LOC is is given, capture to that location instead of
;; prompting."
;;   (let ((org-refile-targets (or targets org-refile-targets))
;;         (prompt (or prompt "Capture Location")))
;;     (if org-capture-overriding-marker
;;         (org-goto-marker-or-bmk org-capture-overriding-marker)
;;       (org-refile t nil nil prompt)))
;;   )

(setq org-capture-templates
      '(("a" "Appointments" entry
         (file+headline "~/Dropbox/orgFiles/Diary/organize.org" "Meetings")
         "* %^{prompt}\nSCHEDULED: %^T\n+ %?")
        ;; as function is not working giving full location.
        ("n" "Notes" entry
         (file+olp "~/Dropbox/orgFiles/Diary/organize.org" "Official" "Notes")
         "* %^{prompt}\n%^T\n+ %?")
        ("N" "Notes" entry
         (file+olp "~/Dropbox/orgFiles/Diary/organize.org" "Personal" "Notes")
         "* %^{prompt}\n%^T\n+ %?")
        ("o" "Other Items Official" entry
         (file+olp "~/Dropbox/orgFiles/Diary/organize.org" "Official")
         "* %^{prompt}\n%^T\n+ %?")
        ("O" "Other Items Personal" entry
         (file+olp "~/Dropbox/orgFiles/Diary/organize.org" "Personal")
         "* %^{prompt}\n%^T\n+ %?")
        ))
;; =======================================================================
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

  ;; Colour-coding categories in org-mode

  (add-hook 'org-finalize-agenda-hook
            (lambda ()
              (save-excursion
                (color-org-header "TODO:" "green")
                (color-org-header "Meetings:" "DarkGreen")
                (color-org-header "Notes:" "#00fa9a")
                (color-org-header "Reports:" "blue3")
                (color-org-header "Tours:" "yellow1")
                (color-org-header "Annv:" "dark cyan")
                (color-org-header "mail:" "yellow")
                (color-org-header "outlay:" "dark orange")
                (color-org-header "Attention:" "chartreuse")
                (color-org-header "personal:" "salmon")
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
                 "\\documentclass{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{hyperref}
\\usepackage{natbib}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{geometry}
\\geometry{a4paper,left=2.5cm,top=2cm,right=2.5cm,bottom=2cm,marginparsep=7pt, marginparwidth=.6in}"
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



(setq org-file-apps
      (append '(
                ("\\.pdf\\'" . "okular %s")
                ) org-file-apps ))

(use-package ox-hugo
  :ensure t
  :after ox)

;; (use-package ox-reveal
;;   :ensure t
;;   :after org)
(add-to-list 'load-path "~/github/org-reveal/")
(require 'ox-reveal)
(setq org-reveal-root "file:///home/arunkhattri/github/reveal.js")
(setq org-reveal-mathjx t)

(use-package plantuml-mode
  :init
  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar"))

(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (emacs-lisp . t)
   ;; (R . t)
   (python . t)
   (ditaa . t)
   (plantuml . t)))

(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")

(use-package all-the-icons
  :ensure t
  :config
    (setq inhibit-compacting-font-caches t))

(use-package neotree
  :ensure t
  :config
    (global-set-key (kbd "<f8>") 'neotree-toggle)
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
    (setq neo-window-fixed-size nil)
    (eval-after-load "neotree"
        '(add-to-list 'window-size-change-functions
                    (lambda (frame)
                        (let ((neo-window (neo-global--get-window)))
                        (unless (null neo-window)
                            (setq neo-window-width (window-width neo-window))))))))

(use-package region-bindings-mode
  :config
  (progn
    ;; Do not activate `region-bindings-mode' in Special modes like `dired' and
    ;; `ibuffer'. Single-key bindings like 'm' are useful in those modes even
    ;; when a region is selected.
    (setq region-bindings-mode-disabled-modes '(dired-mode
                                                ibuffer-mode))

    (region-bindings-mode-enable)

    (defun akk/disable-rbm-deactivate-mark ()
      "Disable `region-bindings-mode' and deactivate mark."
      (interactive)
      (region-bindings-mode -1)
      (deactivate-mark)
      (message "Mark deactivated"))

    (bind-keys
     :map region-bindings-mode-map
      ("<C-SPC>" . akk/disable-rbm-deactivate-mark))))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c l" . 'mc/edit-lines)
         ("C->" . 'mc/mark-next-like-this)
         ("C-<" . 'mc/mark-previous-like-this)
         ("C-c C-<" . 'mc/mark-all-like-this)
         ("C-S-<mouse-1>" . 'mc/add-cursor-on-click))
  :init
  (progn
    ;; Temporary hack to get around bug # 28524 in emacs 26+
    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=28524
    (setq mc/mode-line
          `(" mc:" (:eval (format ,(propertize "%-2d" 'face 'font-lock-warning-face)
                                  (mc/num-cursors)))))))

;;     (setq mc/list-file (locate-user-emacs-file "mc-lists"))

;;     ;; Disable the annoying sluggish matching paren blinks for all cursors
;;     ;; when you happen to type a ")" or "}" at all cursor locations.
;;     (defvar akk/blink-matching-paren--store nil
;;       "Internal variable used to restore the value of `blink-matching-paren'
;; after `multiple-cursors-mode' is quit.")

;;     ;; The `multiple-cursors-mode-enabled-hook' and
;;     ;; `multiple-cursors-mode-disabled-hook' are run in the
;;     ;; `multiple-cursors-mode' minor mode definition, but they are not declared
;;     ;; (not `defvar'd). So do that first before using `add-hook'.
;;     (defvar multiple-cursors-mode-enabled-hook nil
;;       "Hook that is run after `multiple-cursors-mode' is enabled.")
;;     (defvar multiple-cursors-mode-disabled-hook nil
;;       "Hook that is run after `multiple-cursors-mode' is disabled.")

;;     (defun akk/mc-when-enabled ()
;;       "Function to be added to `multiple-cursors-mode-enabled-hook'."
;;       (setq akk/mc-blink-matching-paren--store blink-matching-paren)
;;       (setq blink-matching-paren nil))

;;     (defun akk/mc-when-disabled ()
;;       "Function to be added to `multiple-cursors-mode-disabled-hook'."
;;       (setq blink-matching-paren akk/mc-blink-matching-paren--store))

;;     (add-hook 'multiple-cursors-mode-enabled-hook #'akk/mc-when-enabled)
;;     (add-hook 'multiple-cursors-mode-disabled-hook #'akk/mc-when-disabled)

(use-package expand-region
  :ensure t
  :bind ("C-q" . 'er/expand-region))

(use-package posframe)
(use-package hydra
  :ensure t
  :config
  (use-package hydra-posframe
    :load-path "/home/arunkhattri/github/hydra-posframe"
    :custom
    (hydra-posframe-parameters
     '((left-fringe . 5)
       (right-fringe . 5)))
    :custom-face
    (hydra-posframe-border-face (( t (:background "#6272a4"))))
    :hook (after-init . hydra-posframe-enable)))

;;============================================================
;; Hydra for modes that toggle on and off
;;============================================================

(global-set-key
 (kbd "C-x t")
 (defhydra toggle (:color blue)
   "toggle"
   ("a" abbrev-mode "abbrev")
   ("s" flyspell-mode "flyspell")
   ("p" electric-pair-mode "electric-pair")
   ("l" linum-mode "linum")
   ("v" visual-line-mode "visual")
   ("q" nil "cancel")))

;;============================================================
;; Hydra for navigation
;;============================================================

(global-set-key
 (kbd "C-x j")
 (defhydra gotoline
   (:pre (linum-mode 1)
         :post (linum-mode -1))
   "goto"
   ("t" (lambda () (interactive) (move-to-window-line-top-bottom 0)) "top")
   ("b" (lambda () (interactive) (move-to-window-line-top-bottom -1)) "bottom")
   ("m" (lambda () (interactive) (move-to-window-line-top-bottom)) "middle")
   ("e" (lambda () (interactive) (end-of-buffer)) "end")
   ("c" recenter-top-bottom "recenter")
   ("n" next-line "down")
   ("p" (lambda () (interactive) (forward-line -1)) "up")
   ("g" goto-line "goto-line")
   ))

(use-package org-ref
  :ensure t
  :config
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
  ;; other variables
  (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
        org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
        org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
  (unless (file-exists-p org-ref-pdf-directory)
    (make-directory org-ref-pdf-directory t))
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator "-"
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 5))

;; Other stuff required for basic org-ref-usage
;; (require )
;; (use-package org-ref-pdf
;;   :ensure t)
;; (use-package org-ref-url-utils
;;   :ensure t)

;; make sure that org-latex-pdf-process is set toprocess the bibliography
;; (using) bibtex or biblatex.
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;; git cloned scratch-el
;; https://github.com/ieure/scratch-el.git
  (autoload 'scratch "scratch" nil t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(defun akk-insert-section ()
  "Insert Section in the code"
  (interactive)
  (set 'section (read-string "Enter Section Name: "))
  (save-excursion (insert (concat section (make-string (- fill-column (length section)) ?-)))))

(use-package lua-mode
  :ensure t
  :mode ("\\.lua\\'" "\\.p8\\'"))
  :config
  (add-hook 'lua-mode-hook #'company-mode)

(use-package sql-indent
  :defer t)

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "localhost")
        (port :default 5432)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (setq-local show-trailing-whitespace nil)
            (company-mode t)))

(defun upcase-sql-keywords ()
    (interactive)
    (save-excursion
      (dolist (keywords sql-mode-postgres-font-lock-keywords)
        (goto-char (point-min))
        (while (re-search-forward (car keywords) nil t)
          (goto-char (+ 1 (match-beginning 0)))
          (when (eql font-lock-keyword-face (face-at-point))
            (backward-char)
            (upcase-word 1)
            (forward-char))))))

(use-package emojify
  :init (global-emojify-mode 1))
