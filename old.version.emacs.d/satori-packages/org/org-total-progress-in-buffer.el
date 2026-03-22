(defun satori-calculate-org-progress ()
  "Calculate the overall progression percentage for TODO and DONE entries in the current Org buffer."
  (interactive)
  (let ((total-tasks 0)
        (completed-tasks 0))
    ;; Count all TODO and DONE entries in the buffer
    (org-map-entries
     (lambda ()

       (setq total-tasks (1+ total-tasks))
       (when (string= (org-get-todo-state) "DONE")
         (setq completed-tasks (1+ completed-tasks)))))
    ;; Calculate the percentage
    (let ((progress (if (> total-tasks 0)
                        (* 100 (/ (float completed-tasks) total-tasks))
                      0)))
      (message "Total Progression: %.2f%% (%d/%d completed)"
               progress completed-tasks total-tasks)
      progress)))
