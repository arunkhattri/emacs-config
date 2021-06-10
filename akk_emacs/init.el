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


(provide 'init)
;;; init.el ends here
