(use-package company
  :hook (after-init . global-company-mode))
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)
