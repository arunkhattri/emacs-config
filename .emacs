;;; .emacs -- Summary
;;; My working Emacs comfiguration for linux
;;-*-Emacs-Lisp-*-

;;; Commentary:
;; This is the working init file

;;; Code:

;; ----------------------------------------------------------------------
;; Melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ----------------------------------------------------------------------
;;Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ----------------------------------------------------------------------

;; Paganini themes
;; (use-package paganini-theme
;;   :ensure t
;;   :config
;;   (load-theme 'paganini t))

;; Base16 themes
;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-tomorrow-night t))
;; (Defvar my/base16-colors base16-default-dark-colors)
;; (setq evil-emacs-state-cursor   `(,(plist-get my/base16-colors :base0D) box)
;;       evil-insert-state-cursor  `(,(plist-get my/base16-colors :base0D) bar)
;;       evil-motion-state-cursor  `(,(plist-get my/base16-colors :base0E) box)
;;       evil-normal-state-cursor  `(,(plist-get my/base16-colors :base0B) box)
;;       evil-replace-state-cursor `(,(plist-get my/base16-colors :base08) bar)
;       evil-visual-state-cursor  `(,(plist-get my/base16-colors :base09) box))

;; Material Theme
;; (use-package material-theme
;;   :ensure t
;;   :config
;;   (progn
;;     (load-theme 'material t)))

(use-package atom-one-dark-theme
  :ensure t
  :config
  (progn
    (load-theme 'atom-one-dark t)))
;; (use-package theme-changer
;;   :ensure t
;;   :defer 1
;;   :config
;;   (progn (change-theme 'material-light 'material)))
;; ----------------------------------------------------------------------
;; (load "~/.emacs.d/emacs-config/my-noexternal.el")
;; (load "~/.emacs.d/emacs-config/my-configuration.el")
;; (load "~/.emacs.d/emacs-config/all_packages.el")
;; (load "~/.emacs.d/emacs-config/init_org.el")
;; (load "~/.emacs.d/emacs-config/mail_setup.el")

;; ----------------------------------------------------------------------
;; load customization file, avoid littering here
(setq custom-file "~/github/Dot_files/emacs-config/emacs_custom.el")
(load custom-file)
;; ----------------------------------------------------------------------
(org-babel-load-file (expand-file-name "~/github/Dot_files/emacs-config/my-init.org"))
;;; .emacs ends here
