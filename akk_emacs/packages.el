
;;; packages.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Arun Kr Khattri
;;
;; Author: Arun Kr Khattri <https://github.com/arunkhattri>
;; Maintainer: Arun Kr Khattri <arun.kr.khattri@gmail.com>
;; Created: June 06, 2021
;; Modified: June 06, 2021
;; Version: 0.0.1
;; Keywords: packages
;; Homepage: https://github.com/arunkhattri/init
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
(straight-use-package 'use-package)
;; install use-package

(use-package all-the-icons
  :straight t)

(use-package page-break-lines
  :straight t)

(use-package projectile
  :straight t
  :config
  (projectile-mode +1))


(use-package doom-themes
  :straight t
  :init
  (load-theme 'doom-one t)
  (doom-themes-treemacs-config)
  (setq neo-global--window nil)
  (setq hl-line-sticky-flag nil)
  (setq neo-vc-integration nil)
  (setq neotree-dir-button-keymap nil)
  (setq neotree-file-button-keymap nil)
  (setq neo-path--file-short-name nil)
  (setq neo-vc-for-node nil)
  (setq neo-buffer--insert-fold-symbol nil)
  (setq neo-buffer--node-list-set nil)
  (setq neo-buffer--newline-and-begin nil)
  (setq neo-global--select-window nil)
  (setq neo-buffer--insert-file-entry nil)
  (setq neo-buffer--insert-dir-entry nil)
  (setq neo-buffer--insert-root-entry nil))


(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1))

(use-package evil
  :straight t
  :config (evil-mode t))

(use-package treemacs
  :straight t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         26)
	  
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(electric-pair-mode 1)
(setq electric-pair-pairs
'(
  (?\" . ?\")
  (?\' . ?\')
  (?\{ . ?\})))     

(use-package lsp-mode
  :straight t
  :commands lsp
  :hook(c-mode . lsp))

(use-package lsp-treemacs
  :straight t
  :commands lsp-treemacs-errors-list)

(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)
  (dashboard-refresh-buffer)
  (setq dashboard-items '((recents  . 5)
			  (bookmarks . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/Dropbox/Pictures/arun.png")
  (setq dashboard-banner-logo-title "Welcome to AKK emacs!")
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
	`(((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
	    "Homepage"
	    "Browse homepage"
	    (lambda (&rest _) (browse-url "https://arunkhattri.org")))

	   (,(all-the-icons-faicon "archive" :height 1.1 :v-adjust 0.0)
	    "Update Packages"
	    "Click to updates your packages"
	    (lambda (&rest _) (auto-package-update-now)))

	   (,(all-the-icons-octicon "gear" :height 1.1 :v-adjust 0.0)
	    "Configuration"
	    "Click to config Condor Emacs"
	    (lambda (&rest _) (find-file "~/github/emacs-config/akk_emacs/packages.el"))))))
  (setq dashboard-set-init-info t))

;; evil-commentary
(use-package evil-commentary
  :straight t
  :init (evil-commentary-mode))
(provide 'packages)
;;; packages.el ends here
