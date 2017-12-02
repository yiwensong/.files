; tab display width of 4 columns by default
; (throw everything at the wall, and eventually something will stick...)
(setq-default indent-tabs-mode nil) ; Yelp uses spaces not tabs
(setq-default tab-width 4)  ; Normal emacs tab-width
(setq-default py-smart-indentation nil) ; Don't try to guess tab width
(setq-default py-indent-offset 4) ; emacs-for-python setting
(setq-default python-indent 4) ; emacs-for-python setting

(defun customize-py-tabs ()
    (setq indent-tabs-mode nil
        tab-width 4
        py-smart-indentation nil
        py-indent-offset 4
        python-indent 4
    )
 )
