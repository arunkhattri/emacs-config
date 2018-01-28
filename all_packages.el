;;; .emacs.d/all_packages.el -- Summary
;;; Commentary:
;; all packages which were installed

;;; Code:

(defalias 'list-buffers 'ibuffer)

;;=================================================================== 
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
					;(setq aw-scope 'frame)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
))

;;=================================================================== 
;; UTF-8
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;;=================================================================== 
;; Counsel
(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))
;;=================================================================== 
;; copied from:
;; https://github.com/sejdemyr/.emacs.d/blob/master/init.el
;; validate options
(use-package validate
  :ensure t
  :init
  (use-package seq
    :ensure t))
;;=================================================================== 
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

;;=================================================================== 

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
;;=================================================================== 
;; ;;Swiper
;; (use-package swiper
;;   :ensure t
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (global-set-key "\C-s" 'swiper)
;;     (global-set-key "\C-r" 'swiper)
;;     (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;     (global-set-key [f6] 'ivy-resume)
;;     (setq ivy-display-style 'fancy)
;;     (defun bjm-swiper-recenter (&rest args)
;;       "recenter display after swiper"
;;       (recenter)
;;       )
;;     (advice-add 'swiper :after #'bjm-swiper-recenter)
;;     ))

;;=================================================================== 
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'elfeed-show-mode)
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

;;=================================================================== 
;;magit
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

;;=================================================================== 
;;Elfeed
(global-set-key (kbd "C-x w") 'elfeed)
;; list of feeds
(setq elfeed-feeds
      '(("http://feeds.reuters.com/reuters/INtopNews" ReutersTopNews)
	("http://feeds.reuters.com/reuters/INsportsNews" ReutersSportsNews)
	("http://timesofindia.indiatimes.com/rssfeedstopstories.cms" TOI)
	("http://www.livemint.com/rss/economy_politics" LiveMintEconPolicies)
	("http://www.asianage.com/rss/38" AsianAge)
	("http://feeds.bbci.co.uk/news/rss.xml?edition=asia" BBC)))

(setf url-queue-timeout 30)
(setq-default elfeed-search-filter "@1-week-ago +unread ")

;;=================================================================== 
;;company-mode
(use-package company
  :diminish ""
  :init
  ;; (add-hook 'prog-mode-hook 'company-mode)
  ;; (add-hook 'comint-mode-hook 'company-mode)
  :config
  (global-company-mode)
  ;; Quick-help (popup documentation for suggestions).
  (use-package company-quickhelp
    :ensure t
    :init (company-quickhelp-mode 1))
  (use-package company-web-html)
  ;; Company settings.
  (setq company-tooltip-limit 10)
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
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
  ;; (define-key company-active-map (kbd "SPC") nil))

;; ======================================================================
;; shell-mode
(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))
  
;;Python Mode
(use-package python
  :ensure t
  :config
  (setq python-shell-interpreter "python"))
	;; python-shell-interpreter-args "--simple-prompt --pprint"))

;;elpy
;; (package-initialize)
;; (elpy-enable)
;; (company-quickhelp-mode)
;; (require 'highlight-indentation)
(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  ;; (when (executable-find "ipython")
  ;; (elpy-use-ipython))
  (setenv "WORKON_HOME" "/home/deadlytackler/anaconda3/envs/")
  (pyvenv-mode 1)
  (setq-default indent-tabs-mode nil)
  ;; ;; jedi for auto-completion in elpy
  (setq elpy-rpc-backend "jedi")
  (global-set-key (kbd "<f7>") (kbd "C-u C-c C-c")))
  ;; Python auto completion
  (use-package company-jedi
    :init
    (setq company-jedi-python-bin "python")
    :config
    (add-to-list 'company-backends 'company-jedi))

;; (use-package virtualenvwrapper
;;   :ensure t
;;   :config
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell))
;; ======================================================================
;; copied from:
;; https://github.com/sejdemyr/.emacs.d/blob/master/init.el

;;; emacs speaks statistics
(use-package ess-site
  :load-path "~/.emacs.d/elpa/ess-20171102.958/lisp/"
  :mode ("\\.R\\'" . R-mode)
  :config
  (validate-setq
   ring-bell-function #'ignore
   ess-ask-for-ess-directory nil
   inferior-R-program-name "/usr/bin/R"
   ess-local-process-name "R"
   ansi-color-for-comint-mode 'filter
   comint-scroll-to-bottom-on-input t
   comint-scroll-to-bottom-on-output t
   comint-move-point-for-output t
   ess-default-style 'RStudio)         ; rstudio indentation style

  ;; set assignment operator
  (setq ess-S-assign-key (kbd "C--"))
  (ess-toggle-S-assign-key t)

  ;; disable '_' shortcut
  (ess-toggle-underscore nil)

  ;; automatically complete parentheses etc
  ;; (add-hook 'ess-mode-hook #'electric-pair-mode)

  ;; set piping operator key binding
  ;; http://emacs.stackexchange.com/questions/8041/how-to-implement-the-piping-operator-in-ess-mode
  ;; CTRL-SHIFT-% for pipe operator
  (defun then_R_operator ()
    "R - %>% operator or 'then' pipe operator"
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (just-one-space 1))
  (define-key ess-mode-map (kbd "C-%") 'then_R_operator)
  (define-key inferior-ess-mode-map (kbd "C-%") 'then_R_operator)

  ;; key binding to evaluate current line or marked region
  (defun my-ess-eval ()
    (interactive)
    (if (and transient-mark-mode mark-active)
        (call-interactively 'ess-eval-region)
      (call-interactively 'ess-eval-line)))
  (add-hook 'ess-mode-hook
            '(lambda()
               (local-set-key (kbd "s-m") 'my-ess-eval)))

  ;; key binding to evaluate entire region (whether marked or not)
  (defun my-ess-eval2 ()
    (interactive)
    (call-interactively 'ess-eval-region-or-function-or-paragraph-and-step))
  (add-hook 'ess-mode-hook
            '(lambda()
               (local-set-key (kbd "s-M") 'my-ess-eval2)))

  ;; key binding to load_all() for R devlopment
  (defun my-ess-eval3 ()
    (interactive)
    (call-interactively 'ess-r-devtools-load-package))
  (add-hook 'ess-mode-hook
            '(lambda()
               (local-set-key (kbd "s-B") 'my-ess-eval3)))

  )

;; use pretty mode
;; (add-hook 'ess-mode-hook 'turn-on-pretty-mode)

;; add author info
(defun akk/ess-author-date ()
  (interactive)
  (when (string= major-mode "ess-mode")
    (goto-char (point-min))
    (insert "#' ---\n")
    (insert "#' title: <title>\n")
    (insert "#' author: Arun Kr. Khattri\n")
    (insert "#' Date: ")
    (insert (format-time-string "%F %T\n"))
    (insert "#' ---\n\n")
    (save-buffer)))
(add-hook 'org-babel-post-tangle-hook 'akk/ess-author-date)

;; highlights FIXME: TODO: and BUG: in prog-mode
(add-hook 'prog-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil '(("\\<\\(AKK\\|FIXME\\|TODO\\|BUG\\):" 1
					   font-lock-warning-face t)))))



(setq ess-indent-offset 2)
(setq ess-help-kill-bogus-buffers t)



;; ess-view
(use-package ess-view
  :ensure t)

;; Auto-completion quick help
;; (define-key ac-completing-map (kbd "M-h") 'ac-quick-help) 
;; remove return key as select
;; (define-key ac-completing-map "\r" nil)
;; bind ac-complete to tab
;; (define-key ac-completing-map "\t" 'ac-complete)

 ;; (define-key ac-completing-map [tab] 'ac-complete)
;; (define-key ac-completing-map [return] nil)

;; r-autoyas
(use-package r-autoyas
  :ensure t
  :config
  (progn (add-hook 'ess-mode-hook 'r-autoyas-ess-activate)))
;;=================================================================== 
;; fns+ 
(use-package help-fns+
  :ensure t)
;;=================================================================== 
;; EasyPG : for encryption and decryption of files

(require 'epa)
(epa-file-enable)

;;=================================================================== 
(defvar mode-line-cleaner-alist
  `((company-mode . " α")
    (elpy-mode . " Elp")
    (ivy-mode . " I")
    (undo-tree-mode . " UT")
    (yas/minor-mode . " υ")
    (paredit-mode . " π")
    (eldoc-mode . "")
    (abbrev-mode . "")
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

;;=================================================================== 
;; Web Mode
(use-package web-mode
    :ensure t
    :config
	   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	   (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
	   (setq web-mode-engines-alist
		 '(("django"    . "\\.html\\'")))
	   (setq web-mode-ac-sources-alist
	   '(("css" . (ac-source-css-property))
	   ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
         ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
;;===================================================================
;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :ensure t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

;;=================================================================== 
(use-package cython-mode
  :ensure t
  :mode (("\\.py[xdi]" . cython-mode)))

;;=================================================================== 
;; Ledger mode
(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
;; (add-to-list 'load-path
;;              (expand-file-name "~/.emacs.d/e/ledger/source/lisp/"))
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
;;=================================================================== 

;;rcirc
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

;;=================================================================== 
;;; all_packages.el ends here
