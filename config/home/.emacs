;; MELPA rep
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))

(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "M-c")
  :config
  (setq lsp-java-configuration-runtimes '[(:name "JavaSE-22"
                                                 :path "/usr/lib/jvm/java-22-openjdk"
                                                 :default t)
    			                          (:name "JavaSE-1.8"
                                                 :path "/usr/lib/jvm/java-8-openjdk")])
  :hook
  ((lsp-mode . lsp-enable-which-key-integration)))
(use-package hydra)
(use-package company)
;(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java
  :config
  (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java)
;(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)

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
  (scroll-bar-mode -1)
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
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; auto-fill in text-files
(setq-default indent-tabs-mode nil) ;; use spaces to indent stuff
(add-hook 'prog-mode-hook #'subword-mode) ;; auto-fill in code

;; add ino files to c mode (arduino code)
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))

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
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("d8683d4fc08471cc5d1250e26525a927a02c428ec131ec080eea60662a263d44" "e5494adf200eeff1505839672150dde6053e086869189c381b1ce9b792dda3a8" "c6e9ae1e8dd9a33061f391cb7cb1ddf978031449f40f86f24308b908f216d4d4" default))
 '(inhibit-startup-screen t)
 '(lsp-java-completion-lazy-resolve-text-edit-enabled t)
 '(lsp-java-format-settings-profile nil)
 '(lsp-java-format-settings-url "\"/home/stone/.config/eclipse-formatter.xml\"")
 '(lsp-java-vmargs
   '("-XX:+UseParallelGC" "-XX:GCTimeRatio=4" "-XX:AdaptiveSizePolicyWeight=90" "-Dsun.zip.disableMemoryMapping=true" "-Xmx4G" "-Xms100m"))
 '(package-selected-packages
   '(projectile flycheck yasnippet which-key company lsp-java lsp-mode xresources-theme unfill visual-fill-column lorem-ipsum)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
