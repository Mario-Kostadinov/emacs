(defun insert-today-date ()
  "Insert today's date at point in YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))
