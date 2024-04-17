;; font size, in .1 of a pt
(set-face-attribute 'default nil :height 130)

;; transparent backgrounds
(add-to-list 'default-frame-alist '(alpha-background . 70))
; (add-to-list 'default-frame-alist '(alpha-background . (100 . 70)))

;; add ino files to c mode (arduino code)
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))

;; Turns off the menu bar since it's not particularly useful in terminal
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) 

;; handles transparency changes when focus changes
(set-frame-parameter (selected-frame) 'alpha '(100 80))

;; makes new windows open as frames instead
(setq pop-up-windows t)

;; Allows the buffer to be scrolled instead of the cursor with the mouse wheel
;;;; Mouse scrolling in terminal emacs
(unless (display-graphic-p)
  ;; activate mouse-based scrolling
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
  ) 

;; Sets auto fill to 80 characters
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; auto-fill in text-files
(setq-default indent-tabs-mode nil) ;; use spaces to indent stuff
;; (add-hook 'prog-mode-hook #'auto-fill-mode) ;; auto-fill in code

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
 '(custom-safe-themes
   '("e5494adf200eeff1505839672150dde6053e086869189c381b1ce9b792dda3a8" "c6e9ae1e8dd9a33061f391cb7cb1ddf978031449f40f86f24308b908f216d4d4" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages '(xresources-theme unfill visual-fill-column lorem-ipsum)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
