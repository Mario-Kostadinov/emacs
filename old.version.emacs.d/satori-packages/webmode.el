(use-package web-mode
  :ensure t)
(setq auto-mode-alist
      (append
       '(("\\.vue\\'" . web-mode)   ;; Use web-mode for .vue files
         ("\\.js\\'" . web-mode))   ;; Use web-mode for .js files
       auto-mode-alist))

(add-hook 'web-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
	    (setq display-line-numbers-mode t)
	    ))
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-script-padding 0)
(setq tab-width 2)




