(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-initialize))
