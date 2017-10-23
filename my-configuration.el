;; .emacs.d/my-configuration.el

;;=================================================================== 
;; interface tweaks
(setq inhibit-startup-message t)
(tool-bar-mode -1)

;;=================================================================== 
;;longitude and lattitude of delhi
;; to be used by calendar
(setq calendar-latitude 28.6)
(setq calendar-longitude 77.2)
(setq calendar-location-name "New Delhi, India")
;; Time-Zone for New Delhi
(setq calendar-time-zone +530)
(setq calendar-standard-time-zone-name "IST")

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
(use-package material-theme
  :ensure t
  :config
  (progn (load-theme 'material t)
	 (load-theme 'material-light t)))

(use-package theme-changer
  :ensure t
  :config
  (progn (change-theme 'material-light 'material)))

;; themes
;; (load-theme 'leuven t)
;; (load-theme 'material t)
;; (load-theme 'material-light t)

;; themes-changer
;; (require 'theme-changer)
;; (change-theme 'material-light 'material)
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

;; Powerline theme
(load "~/.emacs.d/emacs-config/init-powerline.el")

;;Powerline
;; (require 'powerline)
;; (powerline-default-theme)
;; (setq powerline-default-separator 'arrow)
;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "#ff8c00"
;;                     :box nil)

;; use term instead of shell, keeping in mind python
;; (setenv "TERM" "xterm")
;;=================================================================== 
