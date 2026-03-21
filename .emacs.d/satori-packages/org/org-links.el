(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c l s") #'org-store-link)
  (define-key org-mode-map (kbd "C-c l i") #'org-id-copy)
  (define-key org-mode-map (kbd "C-c l c") #'org-id-get-create)
  )


(global-set-key (kbd "C-c l s") 'org-store-link)
