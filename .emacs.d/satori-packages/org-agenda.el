;; (setq org-agenda-files '("~/projects/satori-notes"))

(setq satori-agenda-files
      (directory-files "~/projects/satori-notes/agenda/" t "\\.org$"))

;; Tell org-agenda to use them
(setq org-agenda-files satori-agenda-files)
(setq org-agenda-span 14)
;; (setq org-agenda-files (directory-files-recursively "~/projects/satori-notes" "\\.org$"))

(global-set-key (kbd "C-c a") #'org-agenda)

(defun my-org-agenda-work ()
  "Open org-agenda restricted to Work.org."
  (interactive)
  (let ((org-agenda-files '("~/projects/work/omnilinx/org/Work Inbox.org"))
	(org-agenda-span 14)
	)
    (org-agenda )))

(global-set-key (kbd "C-c w") #'my-org-agenda-work)


(defun org-agenda-show-by-version ()
  "Prompt for a VERSION property from the Work Inbox file and show Org Agenda entries with that VERSION."
  (interactive)
  (let* ((work-inbox-file "~/projects/work/omnilinx/org/Work Inbox.org")
         ;; Collect all VERSION property values from the file
         (versions
          (org-with-file-buffer work-inbox-file
            (org-map-entries
             (lambda ()
               (org-entry-get (point) "VERSION"))
             t))) ;; t means search the entire file
         ;; Clean up the list
         (versions (delete-dups (delq nil versions)))
         ;; Prompt user to pick a version
         (version (completing-read "Select VERSION: " versions nil t)))
    ;; Show agenda entries matching the version
    (org-tags-view nil (format "+VERSION=\"%s\"" version))))

