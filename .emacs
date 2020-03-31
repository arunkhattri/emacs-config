;;; .emacs -- Summary
;;; My working Emacs comfiguration for linux
;;-*-Emacs-Lisp-*-

;;; Commentary:
;; This is the working init file

;;; Code:

;; ----------------------------------------------------------------------
;; Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; ----------------------------------------------------------------------
;;Use Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ----------------------------------------------------------------------


(use-package atom-one-dark-theme
  :ensure t
  :config
  (progn
    (load-theme 'atom-one-dark t)))
;; ----------------------------------------------------------------------
(load "~/github/emacs-config/help-fns+.el")

;; ----------------------------------------------------------------------
;; load customization file, avoid littering here
(setq custom-file "~/github/emacs-config/emacs_custom.el")
(load custom-file)
;; ----------------------------------------------------------------------
(org-babel-load-file (expand-file-name "~/github/emacs-config/my-init.org"))
;; ----------------------------------------------------------------------
;; Persistent action helm-again
(custom-set-variables
 '(helm-follow-mode-persistent t))

;;(server-start)
;;; .emacs ends here
