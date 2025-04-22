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


(setq lsp-file-watch-threshold nil)
(setq lsp-enable-indentation nil)
(setq lsp-signature-auto-activate nil)
(setq company-tooltip-align-annotations nil)

(with-eval-after-load 'company
  ;; Only use tooltip frontend (popup)
  (setq company-frontends
        '(company-pseudo-tooltip-frontend
          company-preview-if-just-one-frontend)))

(setq gc-cons-threshold 100000000) ;; 100MB

(setq read-process-output-max (* 1024 1024)) ;; 1MB
(setq lsp-idle-delay 0.500)

