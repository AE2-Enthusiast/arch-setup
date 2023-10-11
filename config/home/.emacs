;; Turns off the menu bar since it's not particularly useful in terminal
(menu-bar-mode -1)

;; Allows the buffer to be scrolled instead of the cursor with the mouse wheel
;;;; Mouse scrolling in terminal emacs
(unless (display-graphic-p)
  ;; activate mouse-based scrolling
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
  )
 

;; Limits lines in programs to 80 characters
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'auto-fill-mode)

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
 '(custom-enabled-themes '(enby))
 '(custom-safe-themes
   '("c6e9ae1e8dd9a33061f391cb7cb1ddf978031449f40f86f24308b908f216d4d4" "f38867c8227b5638f7b414ae20a0feef27d0d4d32a71de6c7b96fb86b12499ae" "eaaa579da5769f96369c3301f337b1fbcf6017e8a341edf386851a60d682bfab" "142a88adf94267f24522a90a4ab1023eaa519df2d0c28036ada9f90f44166a10" "76a935494576dcdeb5243bf901e8890e2dc3f038afa104e5b75add979f51cbb5" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
