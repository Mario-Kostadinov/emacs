(use-package web-mode
  :ensure t)
(setq auto-mode-alist
      (append
       '(("\\.vue\\'" . web-mode)   ;; Use web-mode for .vue files
         ("\\.ts\\'" . web-mode)    ;; Use web-mode for .ts files
         ("\\.js\\'" . web-mode))   ;; Use web-mode for .js files
       auto-mode-alist))

(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-script-padding 0)
