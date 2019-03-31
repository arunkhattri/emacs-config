;; emacs customization files
;; some are auto-generated by emacs

;; automatically added stuff


;; Org-face as per theme
;; (custom-theme-set-faces
;;  'material
;;  '(org-document-info ((t (:foreground "#81d4fa" :height 1.0))))
;;  '(org-document-info-keyword ((t (:foreground "#8bc34a" :height 1.0))))
;;  '(org-document-title ((t (:foreground "#ffffff" :weight bold :height 1.0))))
;;  '(org-level-1 ((t (:inherit outline-1 :background "#455A64" :box (:line-width 1 :style released-button) :weight bold :height 1.1))))
;;  '(org-level-2 ((t (:inherit outline-2 :background "#35575b" :box (:line-width 1 :style released-button) :height 1.1)))))
 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(ansi-term-color-vector
   [unspecified "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"] t)
 '(conda-anaconda-home "/home/arunkhattri/anaconda3")
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "745f50fa29c8427309e172ec9ffb59ddd1e4a62e4871509f424ddfd854a065d2" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(electric-pair-mode t)
 '(fci-rule-color "#383838")
 '(go-eldoc-gocode "gocode")
 '(hl-sexp-background-color "#efebe9")
 '(ledger-reports
   (quote
    (("" "")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files (quote ("~/Dropbox/orgFiles/Diary/organize.org")))
 '(org-agenda-span (quote fortnight))
 '(org-hide-leading-stars t)
 '(org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . fundamental)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh)
     ("plantuml" . plantuml))))
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(org-tags-column -65)
 '(org-use-sub-superscripts (quote {}))
 '(package-selected-packages
   (quote
    (lua-mode clean-aindent-mode dtrt-indent ws-butler company-c-headers helm-gtags ggtags anzu counsel-projectile flycheck-rtags company-rtags helm-rtags irony-eldoc flycheck-irony company-irony cmake-mode clang-format counsel-etags loccur ox-reveal flycheck yasnippet go-complete gotest ess-R-data-view ess-smart-underscore ledger-mode all-the-icons org-bullets projectile company-go go-mode elfeed ess hydra powerline yasnippet-snippets ox-hugo company-jedi company-web region-bindings-mode go-guru org-ref-url-utils org-ref-pdf org-ref elfeed-goodies elfeed-org expand-region mark-multiple multiple-cursors conda paganini-theme paganini company-inf-python company-anaconda go-eldoc cython-mode plantuml-mode company-quickhelp which-key web-mode virtualenvwrapper validate use-package twittering-mode try theme-changer r-autoyas powerline-evil neotree material-theme magit help-fns+ helm-projectile evil-surround evil-leader evil-indent-textobject ess-view elpy cyberpunk-theme counsel ace-window)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Source Code Pro for Powerline" :foundry "ADBO" :slant normal :weight normal :height 90 :width normal))))
;;  '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
;;  '(font-lock-builtin-face ((t (:foreground "tomato"))))
;;  '(font-lock-comment-delimiter-face ((t (:foreground "tan"))))
;;  '(font-lock-comment-face ((t (:foreground "khaki"))))
;;  '(font-lock-constant-face ((t (:foreground "green"))))
;;  '(font-lock-function-name-face ((t (:foreground "dodger blue"))))
;;  '(font-lock-keyword-face ((t (:foreground "deep pink"))))
;;  '(font-lock-regexp-grouping-construct ((t (:foreground "green yellow"))))
;;  '(font-lock-type-face ((t (:foreground "yellow"))))
;;  '(font-lock-variable-name-face ((t (:foreground "dark orange")))))
;;==================================================================== 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
