(use-package lsp-mode
   :init
   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
   ;;(setq lsp-prefer-capf t)
   (setq lsp-keymap-prefix "C-c l")

   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
          (web-mode . lsp)
          ;; if you want which-key integration
          )
     :commands lsp)
 (setq lsp-headerline-breadcrumb-enable nil)
(use-package lsp-ui
     :hook (
            (web-mode . lsp-ui-mode)
            )
     :commands lsp-ui-mode)


(setq lsp-file-watch-threshold nil)
