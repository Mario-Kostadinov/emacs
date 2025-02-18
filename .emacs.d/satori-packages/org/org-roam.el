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


;; Capture Templates
(setq org-roam-capture-templates
       '(("i" "Inbox" entry
         "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n"
         :target (file+head "Inbox.org"
                            "#+title: Inbox\n\n* Inbox\n")
         :unnarrowed t
         :prepend t)

        ("w" "Work Note" plain
         "* Summary\n%?\n\n* Details\n"
         :if-new (file+head "work/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+filetags: work\n\n")
         :unnarrowed t)))

