;; Turns off the menu bar since it's not particularly useful in terminal
(menu-bar-mode -1)

;; Allows the buffer to be scrolled instead of the cursor with the mouse wheel
;; (setq scroll-preserve-screen-position 'always) 

;; (set-face-background (mode-line . "#ffffff"))

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
