; Store backups in their own directory instead of littering the
; whole filesystem with goddamn ~ files.
(setq
   backup-by-copying t ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs_backups")) ; don't litter my fs tree
   version-control t ; use versioned numbers for backup files
   kept-new-versions 6 ; number of newest versions to keep
   kept-old-versions 2 ; number of oldest versions to keep
   delete-old-versions t) ; delete excess backup versions silently
