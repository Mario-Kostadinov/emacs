(use-package visual-fill-column
    :config
      (setq-default visual-fill-column-width 120)
      (setq-default visual-fill-column-center-text t  )
    )
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
