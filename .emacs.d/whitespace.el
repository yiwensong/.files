; Reconfigure whitespace-mode for day-to-day use
(require 'whitespace)
(setq whitespace-style '(face tabs space-before-tab tab-mark))
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default whitespace-line-column 80)
