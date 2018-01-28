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
;; (load "~/.emacs.d/emacs-config/my-noexternal.el")
(load "~/.emacs.d/emacs-config/my-configuration.el")
(load "~/.emacs.d/emacs-config/all_packages.el")
(load "~/.emacs.d/emacs-config/init_org.el")
(load "~/.emacs.d/emacs-config/mail_setup.el")

;; ----------------------------------------------------------------------
;; load customization file, avoid littering here
(setq custom-file "~/.emacs.d/emacs-config/emacs_custom.el")
(load custom-file)
;; ----------------------------------------------------------------------

;;; .emacs ends here
