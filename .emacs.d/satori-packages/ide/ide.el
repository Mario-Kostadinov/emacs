(load-file "~/projects/emacs/.emacs.d/satori-packages/ide/lsp/lsp.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/ide/lsp/lsp-ui.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/webmode.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/ide/code-style/vue.el")
;;(load-file "~/projects/emacs/.emacs.d/satori-packages/prettier.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/treesitter.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/sassmode.el")


(setq auto-mode-alist
      (append
       '(("\\.vue\\'" . web-mode)   ;; Use web-mode for .vue files
         ("\\.ts\\'" . web-mode)    ;; Use web-mode for .ts files
         ("\\.js\\'" . web-mode))   ;; Use web-mode for .js files
       auto-mode-alist))

;; Disable messages in echo area
(setq eldoc-echo-area-use-multiline-p nil)
