(setq inhibit-startup-message t)

(scroll-bar-mode -1)  ; disable the visible scrollbar
(menu-bar-mode -1)  ; disable the toolbar
(tooltip-mode -1)  ; disable tooltip
(set-fringe-mode 10)  ; give some breathing space

;; set up the visible bell
(setq visible-bell t)

;; load theme
;; (load-theme 'tango-dark)

;; straight

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; to use use-package, first install it with straight
(straight-use-package 'use-package)

;; evil mode
(use-package evil
  :straight (:host github :repo "emacs-evil/evil")
  :config
  (evil-mode 1))

;; command-log-mode
(use-package command-log-mode
  :straight (:host github :repo "lewang/command-log-mode"))

;; ivy
(use-package ivy
  :straight (:host github :repo "abo-abo/swiper")
  :diminish
  :bind(("C-s" . swiper)
	:map ivy-minibuffer-map
	("TAB" . ivy-alt-done)
	("C-l" . ivy-alt-done)
	("C-j" . ivy-next-line)
	("C-k" . ivy-previous-line)
	:map ivy-switch-buffer-map
	("C-k" . ivy-previous-line)
	("C-l" . ivy-done)
	("C-d" . ivy-switch-buffer-kill)
	:map ivy-reverse-i-search-map
	("C-k" . ivy-previous-line)
	("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;;
(use-package general
  :straight (:host github :repo "noctuid/general.el"))

  
;; themes: doom themes
(use-package doom-themes
  :straight (:host github :repo "hlissner/emacs-doom-themes")
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t))

;; -----------------------------------------------------------------------

;; key binding change M-; to comment/uncomment to 'gc'
(general-define-key
 :keymaps '(normal insert)
 "gc" 'comment-dwim)
