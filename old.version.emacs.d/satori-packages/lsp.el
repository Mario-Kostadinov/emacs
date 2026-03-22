(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-lens-enable t
        lsp-disabled-clients '(volar vuels)) ; disable Vue servers
  ;; ensure only ts-ls is used for .ts files
  (with-eval-after-load 'lsp-mode
    (add-to-list 'lsp-enabled-clients 'ts-ls)))
 (setq lsp-headerline-breadcrumb-enable nil)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t))



(setq lsp-file-watch-threshold nil)


;; ─── Tree-sitter grammars ──────────────────────────────────────
(setq treesit-language-source-alist
      '((typescript "https://github.com/tree-sitter/tree-sitter-typescript"
                    "master" "typescript/src")))

;; Install grammar if not already installed
(unless (treesit-language-available-p 'typescript)
  (treesit-install-language-grammar 'typescript))

(use-package treesit
  :ensure nil ; built-in
  :bind (:map typescript-ts-mode-map
         ("M-n" . treesit-next-sibling)
         ("M-p" . treesit-prev-sibling)
         ("M-u" . treesit-parent-node)
         ("C-M-a" . treesit-beginning-of-defun)
         ("C-M-e" . treesit-end-of-defun)
         ("C-M-h" . treesit-mark-defun)))

;; ─── TypeScript (tree-sitter) ─────────────────────────────────
(use-package typescript-ts-mode
  :mode "\\.ts\\'"
  :hook ((typescript-ts-mode . lsp-deferred)
         (typescript-ts-mode . display-line-numbers-mode))
  :config
  (setq typescript-ts-mode-indent-offset 2))

;; ─── Line numbers ─────────────────────────────────────────────
(setq display-line-numbers-type 'relative)
(add-hook 'typescript-ts-mode-hook #'display-line-numbers-mode)
