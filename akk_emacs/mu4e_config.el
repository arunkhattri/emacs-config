;;; mu4e_config.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Arun Kr Khattri
;;
;; Author: Arun Kr Khattri <https://github.com/deadlytackler>
;; Maintainer: Arun Kr Khattri <arun.kr.khattri@gmail.com>
;; Created: June 15, 2021
;; Modified: June 15, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/deadlytackler/mu4e_config
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

;; ===========================================================================
;; mail configuration
;; ===========================================================================
(setq mu4e-get-mail-command "mbsync -a")
(setq sendmail-program "/usr/bin/msmtp"
    send-mail-function #'smtpmail-send-it
    message-sendmail-f-is-evil t
    message-sendmail-extra-arguments '("--read-envelope-from")
    message-send-mail-function #'message-send-mail-with-sendmail)
(setq mu4e-update-interval (* 5 60))
(setq mu4e-maildir "~/Dropbox/personalMail/")
(set-email-account! "gmail"
                    '((user-mail-address . "arun.kr.khattri@gmail.com")
                      (user-full-name . "Arun Kr. Khattri" )
                      (mu4e-root-maildir . "~/Dropbox/personalMail/akkGmail/")
                      (mu4e-drafts-folder . "/akkGmail/Drafts")
                      (mu4e-sent-folder . "/akkGmail/Sent Mail")
                      (mu4e-trash-folder . "/akkGmail/Trash")
                      (mu4e-spam-folder . "/akkGmail/Spam")
                      (mu4e-compose-signature . (concat
                                                 "With regards\n"
                                                 "Arun Kr. Khattri\n\n\n"
                                                 "An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.\n"
                                                 " *********************************************************************************\n"
                                                 " This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the system manager. This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. If you are not the intended recipient you are notified that disclosing, copying, distributing or taking any action in reliance on the contents of this information is strictly prohibited . The information contained in this mail is propriety and strictly confidential.\n"
                                                 " *********************************************************************************\n"
                                                 " CONFIDENTIALITY NOTICE This e-mail message and any attachments are only for the use of the intended recipient and may contain information that is privileged, confidential or exempt from disclosure under applicable law. If you are not the intended recipient, any disclosure, distribution or other use of this e-mail message or attachments is prohibited. If you have received this e-mail message in error, please delete and notify the sender immediately. Thank you.\n"
                                                 ))) t)
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
  ;; Displaying rich-text messages
  ;; Attaching files with dired
(use-package gunus-dired
  :straight t
  :config
  ;; make the `gnus-dired-mail-buffers' function also work on
  ;; message-mode derived modes, such as mu4e-compose-mode
    (defun gnus-dired-mail-buffers ()
	"Return a list of active message buffers."
	(let (buffers)
	(save-current-buffer
	    (dolist (buffer (buffer-list t))
	    (set-buffer buffer)
	    (when (and (derived-mode-p 'message-mode)
			(null message-sent-message-via))
		(push (buffer-name buffer) buffers))))
	(nreverse buffers)))

  (setq gnus-dired-mail-mode 'mu4e-user-agent)
  (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode))
  ;; mark the file(s) in dired you would like to attach and press C-c RET C-a,
  ;; and you’ll be asked whether to attach them to an existing message, or create a new one.
  ;; ----------------------------------------------------------------------------------
  ;; using dark-theme, change the luminosity
  ;; (setq shr-color-visible-luminance-min 80)
  ;; save message
(defun djcb-mu4e-copy-message-at-point (&optional dir)
"Copy message at point to somewhere else as <date>_<subject>.eml."
(interactive)
(let* ((msg (mu4e-message-at-point))
        (target (format "%s_%s.eml"
                        (format-time-string "%F" (mu4e-message-field msg :date))
                        (or (mu4e-message-field msg :subject) "No subject"))))
(copy-file
(mu4e-message-field msg :path)
(format "%s/%s" (or dir (read-directory-name "Copy message to: ")) target) 1))))

(provide 'mu4e_config)
;;; mu4e_config.el ends here
