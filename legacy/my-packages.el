;;; .emacs.d/my-packages.el -- Summary
;;; Commentary:
;; all packages which were installed

;;; Code:

(defalias 'list-buffers 'ibuffer)

;;--------------------------------------------------------------------
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
					;(setq aw-scope 'frame)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
))

;;--------------------------------------------------------------------
;; UTF-8
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;; ==================================================
;; Councel
;; (use-package counsel
;;   :ensure t
;;   )
;; ==================================================
;;Swiper
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key "\C-r" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key [f6] 'ivy-resume)
    (setq ivy-display-style 'fancy)
    (defun bjm-swiper-recenter (&rest args)
      "recenter display after swiper"
      (recenter)
      )
    (advice-add 'swiper :after #'bjm-swiper-recenter)
    ))

;; ==================================================
(use-package neotree
  :ensure t
  :config

    (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir)

  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
      (evil-define-key 'normal neotree-mode-map (kbd "I") 'neotree-hidden-file-toggle)
      (evil-define-key 'normal neotree-mode-map (kbd "z") 'neotree-stretch-toggle)
      (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
      (evil-define-key 'normal neotree-mode-map (kbd "m") 'neotree-rename-node)
      (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
      (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)

      (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)
      (evil-define-key 'normal neotree-mode-map (kbd "S") 'neotree-enter-horizontal-split)

      (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))))
;;--------------------------------------------------------------------

;;elpy
;; (package-initialize)
;; (elpy-enable)
;; (company-quickhelp-mode)
;; (require 'highlight-indentation)
;; (use-package elpy
;;   :ensure t
;;   :config
;;   (elpy-enable)
;;   (when (executable-find "ipython")
;;   (elpy-use-ipython))
;;   ;; (setenv "WORKON_HOME" "~/anaconda3/envs/")
;;   (pyvenv-mode 1)
;;   (setq-default indent-tabs-mode nil)
;;   ;; ;; jedi for auto-completion in elpy
;;   (setq elpy-rpc-backend "jedi")
;;   (global-set-key (kbd "<f7>") (kbd "C-u C-c C-c")))
;;   ;; Python auto completion
;;   (use-package company-jedi
;;     :init
;;     (setq company-jedi-python-bin "python")
;;     :config
;;     (add-to-list 'company-backends 'company-jedi))



;;----------------------------------------------------------------------
;;Python Mode
(use-package python
  :ensure t
  :config
  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "-i"))

;;--------------------------------------------------------------------
;; ESS

;;(add-to-list 'load-path "~/.emacs.d/elpa/ess-20160602.203/lisp")

;; below config adapted from
;; http://emacs.readthedocs.io/en/latest/ess__emacs_speaks_statistics.html
(load "ess-site")
(setq ess-ask-for-ess-directory nil) ;; start R on default folder
(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter) ;;
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(setq ess-eval-visibly-p 'nowait) ;; no waiting while ess evalating

;; change Smart-S (<-) key to ;

;; (defun set-my-ess-assign-key ()
;;   (local-unset-key (kbd "_"))
;;   (local-set-key (kbd ";") 'ess-smart-S-assign)
;;   (setq ess-smart-S-assign-key ";")
;;   (ess-toggle-S-assign nil)
;;   (ess-toggle-S-assign nil))

(setq ess-smart-S-assign-key ";")
(ess-toggle-S-assign nil)
(ess-toggle-S-assign nil)
;; (ess-toggle-underscore nil)
					; leave underscore key alone!
;; Syntax highlight

(setq ess-R-font-lock-keywords
    '((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T)
     (ess-R-fl-keyword:%op%)))

;; use pretty mode
(add-hook 'ess-mode-hook 'turn-on-pretty-mode)

;; add author info
(defun akk/ess-author-date ()
  (interactive)
  (when (string= major-mode "ess-mode")
    (goto-char (point-min))
    (insert "#' ---\n")
    (insert "#' title: <title>\n")
    (insert "#' author: Arun Kr. Khattri\n")
    (insert "#' Date: ")
    (insert (format-time-string "%F %T\n"))
    (insert "#' ---\n\n")
    (save-buffer)))
(add-hook 'org-babel-post-tangle-hook 'akk/ess-author-date)

;; highlights FIXME: TODO: and BUG: in prog-mode
(add-hook 'prog-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil '(("\\<\\(AKK\\|FIXME\\|TODO\\|BUG\\):" 1
					   font-lock-warning-face t)))))



(setq ess-indent-offset 2)
(setq ess-help-kill-bogus-buffers t)



;; ess-view
;; (require 'ess-view)

;; Auto-completion quick help
;; (define-key ac-completing-map (kbd "M-h") 'ac-quick-help) 
;; remove return key as select
;; (define-key ac-completing-map "\r" nil)
;; bind ac-complete to tab
;; (define-key ac-completing-map "\t" 'ac-complete)

 ;; (define-key ac-completing-map [tab] 'ac-complete)
;; (define-key ac-completing-map [return] nil)

;; r-autoyas
;; (require 'r-autoyas)
;; (add-hook 'ess-mode-hook 'r-autoyas-ess-activate)

;;--------------------------------------------------------------------
;;ispell
;; (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin")
;; (setq ispell-program-name "aspell")
;; (setq ispell-personal-dictionary "~/.ispell")
;; (require 'ispell)

;;--------------------------------------------------------------------
;;twittering-mode
(use-package twittering-mode
  :ensure t
  :config
  (setq twittering-use-master-password t)
  (setq twittering-icon-mode t)
  (setq twittering-timer-interval 300)
  (setq twittering-url-show-status nil))
;; (require 'twittering-mode):
;; (setq twittering-cert-file '("C:/cygwin64/usr/ssl/certs/ca-bundle.crt"
;; 			     "C:/cygwin64/usr/ssl/certs/ca-bundle.trust.crt"))
;; (setq twittering-use-master-password t)

;;======================================================================
;;go
(setenv "GOPATH" "/home/arunkhattri/work/src/golang.org/x/tools/godoc")
(setenv "GOPATH" "/work/")
(setenv "GOROOT" "~/usr/local/Go/")
;; (use-package company-go
;;   :defer t
;;   :config
;;   (setq company-tooltip-limit 20))

;; gofmt reformats code into the Go coding Standard
;; (setq 'exec-path ("d:/Go/bin"))
;; (add-to-list 'exec-path "d:/work/bin")
;; (add-hook 'before-save-hook 'gofmt-before-save) ;now redundant

;; Autocomplete for go
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
  (require 'auto-complete-config)
  (require 'go-autocomplete))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  ; Go oracle
  ;; (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;======================================================================
;;yas


(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	"~/.emacs.d/elpa/yasnippet-20160801.1142/snippets"))
;;======================================================================
;;flycheck
(global-flycheck-mode)

;;======================================================================
;;magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  
  (defun magit-insert-remote-header ()
    "Insert a header line about the remote of the current branch."
    (-when-let (remote (or (magit-get-remote)
                           (let ((remotes (magit-list-remotes)))
                             (or (car (member "origin" remotes))
                                 (car remotes)))))
      (magit-insert-section (remote remote)
        (magit-insert
         (concat (format "%-10s" "Remote: ")
                 (propertize remote 'face 'magit-branch-remote) " "
                 (magit-get "remote" remote "url") "\n")))))
  )

;;======================================================================
(defun xah-run-current-file ()
  "Execute the current file.
For example, if the current buffer is the file x.py, then it'll call 「python x.py」 in a shell.
The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, Bash, Ocaml, Visual Basic, TeX, Java, Clojure.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
version 2016-01-28"
  (interactive)
  (let (
         (ξsuffix-map
          ;; (‹extension› . ‹shell program name›)
          `(
            ("go" . "go run")
            ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
            ))

         ξfname
         ξfSuffix
         ξprog-name
         ξcmd-str)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq ξfname (buffer-file-name))
    (setq ξfSuffix (file-name-extension ξfname))
    (setq ξprog-name (cdr (assoc ξfSuffix ξsuffix-map)))
    (setq ξcmd-str (concat ξprog-name " \""   ξfname "\""))

    (cond
     ((string-equal ξfSuffix "el") (load ξfname))
     ((string-equal ξfSuffix "java")
      (progn
        (shell-command ξcmd-str "*xah-run-current-file output*" )
        (shell-command
         (format "java %s" (file-name-sans-extension (file-name-nondirectory ξfname))))))
     (t (if ξprog-name
            (progn
              (message "Running…")
              (shell-command ξcmd-str "*xah-run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))

(global-set-key (kbd "<f8>") 'xah-run-current-file)

;;======================================================================
;; EIN
(use-package ein
  :ensure t
  :config
  (setq ein:use-auto-complete t))
;;(require 'ein)
;;(setq ein:use-auto-complete t)
;; ======================================================================
;;electric pair mode
(electric-pair-mode 1)

;; ======================================================================
;;Elfeed
(global-set-key (kbd "C-x M-w") 'elfeed)
;; list of feeds
(setq elfeed-feeds
      '(("http://feeds.reuters.com/reuters/INtopNews" ReutersTopNews)
	("http://feeds.reuters.com/reuters/INsportsNews" ReutersSportsNews)
	("http://timesofindia.indiatimes.com/rssfeedstopstories.cms" TOI)
	("http://www.livemint.com/rss/economy_politics" LiveMintEconPolicies)
	("http://www.asianage.com/rss/38" AsianAge)
	("http://feeds.bbci.co.uk/news/rss.xml?edition=asia" BBC)))

(setf url-queue-timeout 30)
(setq-default elfeed-search-filter "@1-week-ago +unread ")
;;======================================================================
;; w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;;change w3m user-agent to android
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

;;quick access google search
(defun google ()
  (interactive)
  (browse-url "https://google.co.in"))

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
   (concat "https://" site)))

;; enable the use of cookies!

(setq w3m-use-cookies t)

;; No weird characters
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

;; proper display of bullet character as + (for ascii )
(standard-display-ascii ?\225 [?+])
;; gnus
;; read html mail
(setq mm-text-html-renderer 'w3m)

;; video url
(defun w3m-play-youtube-video ()
  (interactive)
  (play-youtube-video
   (w3m-print-this-url (point))))
(global-set-key (kbd "<f9> y") 'w3m-play-youtube-video)

;; ======================================================================
;;company-mode
(use-package company
  :diminish ""
  :init
  ;; (add-hook 'prog-mode-hook 'company-mode)
  ;; (add-hook 'comint-mode-hook 'company-mode)
  :config
  (global-company-mode)
  ;; Quick-help (popup documentation for suggestions).
  (use-package company-quickhelp
    :if window-system
    :init (company-quickhelp-mode 1))
  (use-package company-web-html)
  ;; Company settings.
  (setq company-tooltip-limit 10)
  (setq company-idle-delay 0.2)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  ;; weight by frequency
  (setq company-transformers '(company-sort-by-occurrence))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  ;; prevent company from completing on its own when we type regular characters
  (define-key company-active-map (kbd "SPC") nil))

;; ======================================================================
;; Auto-completion
;; (ac-config-default)

;;Evil Mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
;;  (use-package evil-jumper
;;    :ensure t
;;    :config
;;    (global-evil-jumper-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-indent-textobject
    :ensure t))

;; ======================================================================
;; Emacs Markdown Mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;; ======================================================================
;; Web Mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'")))
  ;; (setq web-mode-ac-sources-alist
  ;;       '(("css" . (ac-source-css-property))
  ;;         ("html" . (ac-source-words-in-all-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset 2))


;; ----------------------------------------------------------------------
;; fns+ 
(use-package help-fns+
  :ensure t)
;; ----------------------------------------------------------------------
;; EasyPG : for encryption and decryption of files

(require 'epa)
(epa-file-enable)

;; ----------------------------------------------------------------------
;;; my-packages.el ends here
