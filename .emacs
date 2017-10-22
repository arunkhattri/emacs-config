;;; .emacs -- Summary
;;; My working Emacs comfiguration for linux
;;-*-Emacs-Lisp-*-

;;; Commentary:
;; This is the working init file

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/emacs-config/my-noexternal.el")
(load "~/.emacs.d/emacs-config/my-configuration.el")
(load "~/.emacs.d/emacs-config/all_packages.el")
(load "~/.emacs.d/emacs-config/init_org.el")

;; ----------------------------------------------------------------------
;; load customization file, avoid littering here
(setq custom-file "~/.emacs.d/emacs-config/emacs_custom.el")
(load custom-file)
;; ----------------------------------------------------------------------

;;; .emacs ends here
