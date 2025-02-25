(setq satori-org-roam-directory "~/projects/satori-notes")    ;; org roam notes directory
;; --- project.el ---

(use-package org-roam
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        ("C-c d c" . org-roam-dailies-capture-today)
        ("C-c d s" . org-roam-dailies-goto-today)
        )
  :config
  (setq org-roam-directory satori-org-roam-directory))


