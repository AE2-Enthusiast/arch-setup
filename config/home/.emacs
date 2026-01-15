(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package auctex)
(use-package projectile)
(use-package yasnippet :config (yas-global-mode))
(use-package hydra)
(use-package vertico)
(use-package which-key :config (which-key-mode))
; (use-package jarchive
;  :ensure t
;  :after eglot
;  :config
                                        ;  (jarchive-setup))
(use-package corfu
  ;; Optional customizations
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-on-exact-match t)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))
;; Turns off the menu bar since it's not particularly useful
(menu-bar-mode -1)

;(defun on-terminal-setup-setup ()
  "sets up terminal specific stuff"
  ;; Allows the buffer to be scrolled instead of the cursor with the mouse wheel
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;(defun on-gui-setup-setup ()
  "Sets up GUI specific stuff"

    ;; turns off scroll bar and tool bar
  (tool-bar-mode -1)
  
  ;; transparent backgrounds
  (add-to-list 'default-frame-alist '(alpha-background . 75))
  ;(add-to-list 'default-frame-alist '(alpha . (100 80)))



  ;; handles transparency changes when focus changes
  ; (set-frame-parameter (selected-frame) 'alpha '(100 80))

  ;; font size, in .1 of a pt
  (set-face-attribute 'default nil :height 125)

;(if (display-graphic-p)
;    (on-gui-setup-setup())
;  (on-terminal-setup-setup()))

;; Sets auto fill to 80 characters
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'global-display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'auto-fill-mode) ;; auto-fill in text-files
(add-hook 'prog-mode-hook 'auto-fill-mode)
(setq-default indent-tabs-mode nil) ;; use spaces to indent stuff
(setq-default tab-width 2) ;; use 2 spaces to indent
(setq js-indent-level 2)
(add-hook 'prog-mode-hook #'subword-mode) ;; see camelCase as separate words when moving by word

;; add ino files to c mode (arduino code)
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
;; prefer web-mode over php-mode
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;(add-to-list 'major-mode-remap-alist '(php-mode . web-mode))
;; use typescript mode in .ts files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))

(defun my-jdtls-program-command-constructor (_interactive)
  `("jdtls" :initializationOptions (:extendedClientCapabilities
                                    (:classFileContentsSupport t
                                     :skipProjectConfiguration t))))

;; Saves autosaves files somewhere else, ie in ~/.emacs.d/saves
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/saves/" t)))

;;Org Mode

;;Allows the use of letters as list indices
(setq org-list-allow-alphabetical t)
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(corfu-auto t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("1498f18622a6b6afa91dcaa6c27febe439412dec96905b38cd9ef4f4235a7538"
     "d8683d4fc08471cc5d1250e26525a927a02c428ec131ec080eea60662a263d44"
     "e5494adf200eeff1505839672150dde6053e086869189c381b1ce9b792dda3a8"
     "c6e9ae1e8dd9a33061f391cb7cb1ddf978031449f40f86f24308b908f216d4d4" default))
 '(inhibit-startup-screen t)
 '(lsp-enable-file-watchers nil)
 '(lsp-java-completion-lazy-resolve-text-edit-enabled t)
 '(lsp-java-format-settings-profile nil)
 '(lsp-java-format-settings-url "\"/home/stone/.config/eclipse-formatter.xml\"")
 '(lsp-java-vmargs
   '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90"
     "-Dsun.zip.disableMemoryMapping=true" "-Xmx4G" "-Xms100m"))
 '(org-format-latex-options
   '(:foreground default :background Transparent :scale 1.5 :html-foreground
                 "Black" :html-background "Transparent" :html-scale 1.0
                 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(auctex autodisass-java-bytecode company corfu csv-mode eglot-java ement
            flycheck green-phosphor-theme helm json-mode lsp-java php-mode popup
            projectile rust-mode tree-sitter-langs vertico web-mode which-key
            yasnippet))
 '(rust-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
