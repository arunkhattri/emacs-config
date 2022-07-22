;; -*- lexical-binding: t; -*-
;;; init.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Arun Kr Khattri
;;
;; Author: Arun Kr Khattri <https://github.com/arunkhattri>
;; Maintainer: Arun Kr Khattri <arun.kr.khattri@gmail.com>
;; Created: June 06, 2021
;; Modified: June 06, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
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
(setq package-enable-at-startup nil)
;; to prevent package.el loading packages prior to their init-file loading.

(menu-bar-mode -1)
(show-paren-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)



(setq user-emacs-directory ' "~/github/emacs-config/akk_emacs")

;;; Straight:
(setq straight-check-for-modifications nil)
;; will manually invoke M-x straight-rebuild-package or M-x straight-rebuild-all
;; or in case when metadata(recipe or the Emacs version) changes
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

;; load packages file
(setq init-package (expand-file-name "packages.el" user-emacs-directory))
;;(setq mu4e-package (expand-file-name "mu4e_config.el" user-emacs-directory))
(load init-package)
;;(load mu4e-package)
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
