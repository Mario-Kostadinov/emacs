(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-links.el")

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("cf" . "src conf"))
(add-to-list 'org-structure-template-alist '("jv" . "src java"))



(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-startup-indented t)

(defun my/org-clock-todo-change ()
  (cond
   ;; If we moved into IN-PROGRESS → clock in
   ((string= org-state "IN-PROGRESS")
    (org-clock-in))
   ;; If we moved out of IN-PROGRESS → clock out
   ((and org-last-state
         (string= org-last-state "IN-PROGRESS"))
    (org-clock-out))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i)" "WAITING(w)" "ON-HOLD(h)" "|" "DONE(d)" "CANCELLED(c)")))


(defun org-clock-todo-change ()
  (cond
   ;; If we moved into IN-PROGRESS → clock in
   ((string= org-state "IN-PROGRESS")
    (org-clock-in))
   ;; If we moved out of IN-PROGRESS → clock out
   ((and org-last-state
         (string= org-last-state "IN-PROGRESS"))
    (org-clock-out))))
(add-hook 'org-after-todo-state-change-hook #'my/org-clock-todo-change)

(setq org-log-done 'time)

(setq org-log-into-drawer "LOGBOOK") ;; I think this keeps the :logbook: from expanding when using tabs


(setq org-refile-targets '((nil :maxlevel . 10)))
(setq org-refile-use-outline-path 'buffer-name)
(setq org-outline-path-complete-in-steps nil)
