(load-file "~/.emacs.d/sensible-defaults.el")
(load-file "~/.emacs.d/python-spacing.el")
(load-file "~/.emacs.d/backupfiles.el")
(load-file "~/.emacs.d/pymacs.el")
(load-file "~/.emacs.d/whitespace.el")
(load-file "~/.emacs.d/cheetah.el")

(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)
 ;; (set-frame-parameter nil 'background-mode 'dark)
 ;; (set-terminal-parameter nil 'background-mode 'dark)
(global-linum-mode t)
(xterm-mouse-mode t)
 ;; (mouse-wheel-mode t)
(setq scroll-margin 2)
(setq scroll-conservatively 101
      scroll-margin 0
      scroll-preserve-screen-position 't)
(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
