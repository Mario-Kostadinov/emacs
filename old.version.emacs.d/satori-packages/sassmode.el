(use-package sass-mode
:ensure t)
(setq auto-mode-alist
      (append
       '(("\\.sass\\'" . sass-mode))
       auto-mode-alist))

(add-hook 'sass-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil
                  tab-width 2
                  css-indent-offset 2)))
