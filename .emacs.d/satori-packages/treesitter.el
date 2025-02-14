(use-package tree-sitter 
    :hook ((js-mode . tree-sitter-mode)
           (typescript-mode . tree-sitter-mode)
           (vue-mode . tree-sitter-mode)
           (web-mode . tree-sitter-mode)
           )
    :config
    (global-tree-sitter-mode))
 
  (use-package tree-sitter-langs
  :after tree-sitter)
