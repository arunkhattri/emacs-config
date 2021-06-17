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

(setq mu4e-update-interval (* 10 60))
(setq mu4e-maildir "~/Dropbox/combinedMailDir/")
(set mu4e-contexts
      `( ,(make-mu4e-context
                :name "personal"
                ;; :enter-func (lambda () (mu4e-message "Entering Private context"))
                        ;; :leave-func (lambda () (mu4e-message "Leaving Private context"))
                ;; we match based on the contact-fields of the message
                ;; :match-func lambda (msg)
                ;; (when msg
                ;;   (string-prefix-p "/PMaildir/" (mu4e-message-field msg :maildir)))
                :vars '((user-mail-address . "arun.kr.khattri@gmail.com")
                        (user-full-name . "Arun Kr. Khattri" )
                                (mu4e-root-maildir . "~/Dropbox/combinedMailDir/PMaildir/")
                                (mu4e-drafts-folder . "/[Gmail].Drafts")
                                (mu4e-sent-folder . "/[Gmail].Sent Mail")
                                (mu4e-trash-folder . "/[Gmail].Trash")
                                (mu4e-spam-folder . "/[Gmail].Spam")
                        (mu4e-compose-signature . (concat
                                                        "With regards\n"
                                                        "Arun Kr. Khattri\n\n\n"
                                                        "An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.\n"
                                                        " *********************************************************************************\n"
                                                        " This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the system manager. This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. If you are not the intended recipient you are notified that disclosing, copying, distributing or taking any action in reliance on the contents of this information is strictly prohibited . The information contained in this mail is propriety and strictly confidential.\n"
                                                        " *********************************************************************************\n"
                                                        " CONFIDENTIALITY NOTICE This e-mail message and any attachments are only for the use of the intended recipient and may contain information that is privileged, confidential or exempt from disclosure under applicable law. If you are not the intended recipient, any disclosure, distribution or other use of this e-mail message or attachments is prohibited. If you have received this e-mail message in error, please delete and notify the sender immediately. Thank you.\n"
                                                        ))))
     ,(make-mu4e-context
  :name "official"
  :enter-func (lambda () (mu4e-message "Switch to the Work context"))
  ;; no leave-func
  ;; we match based on the maildir of the message
  ;; this matches maildir /citybond and its sub-directories
  ;; :match-func (lambda (msg)
  ;;       	(when msg
  ;;       	  (string-prefix-p "/OMaildir/" (mu4e-message-field msg :maildir))))
  :vars '(( user-mail-address . "arun.khattri@citybond.in")
	  ( user-full-name . "Arun Kr. Khattri" )
                (mu4e-root-maildir . "~/Dropbox/combinedMailDir/OMaildir/")
                (mu4e-drafts-folder . "/[Gmail].Drafts")
                (mu4e-sent-folder . "/[Gmail].Sent Mail")
                (mu4e-trash-folder . "/[Gmail].Trash")
                (mu4e-spam-folder . "/[Gmail].Spam")
	  ( mu4e-compose-signature  .
	                            (concat
	                             "Arun Kr. Khattri\n"
	                             "GM Business Development\n\n"
                                           "Unistone Panels Pvt. Ltd"
                                           "71/6 F, Rama Road Industrial Area"
                                           "Najafgarh Marg, New Delhi - 110015"
                                           "M: +91 7489924198"
                                           "www.citybond.in"))))))

  ;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
  ;; guess or ask the correct context, e.g.

  ;; start with the first (default) context;
  ;; default is to ask-if-none (ask when there's no context yet, and none match)
  ;; (setq mu4e-context-policy 'pick-first)

  ;; compose with the current context is no context matches;
  ;; default is to ask
  ;; (setq mu4e-compose-context-policy 'ask-if-none)

  ;; don't save message to Sent Messages, Gmail/IMAP takes care of this

  ;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
  ;; Displaying rich-text messages
  ;; Attaching files with dired
(after! gnus-dired
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


(provide 'mu4e_config)
;;; mu4e_config.el ends here
