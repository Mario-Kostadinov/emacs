(use-package sass-mode
:ensure t)
(setq auto-mode-alist
      (append
       '(("\\.sass\\'" . sass-mode))
       auto-mode-alist))
