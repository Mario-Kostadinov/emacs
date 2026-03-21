(load-file "~/projects/emacs/.emacs.d/satori-packages/yasnippet/yasnippet.el")

(use-package company
  :hook (after-init . global-company-mode))
;; (setq company-idle-delay 0.01)
