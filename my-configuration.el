;; .emacs.d/my-configuration.el

;; (setq inhibit-startup-message t)
;; (tool-bar-mode -1)

;;=================================================================== 
;; Language environment
(set-language-environment "UTF-8")

;;=================================================================== 
;; Melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;;=================================================================== 

;;Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;=================================================================== 
;; try package
(use-package try
  :ensure t)

;;=================================================================== 
;; which key
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;=================================================================== 
;; IDO Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;; (setq ido-max-directory-size 100000)
(ido-mode (quote both))

;;=================================================================== 
;; make ibuffer default
(defalias 'list-buffers 'ibuffer)

;;=================================================================== 
;; Ace window
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

;;=================================================================== 
