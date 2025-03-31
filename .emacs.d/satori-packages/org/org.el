(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-styling.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-total-progress-in-buffer.el")

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("cf" . "src conf"))


;; (add-hook 'org-mode-hook 'satori-disable-line-numbers)
;; (add-hook 'org-mode-hook #'visual-line-mode)
;; (add-hook 'org-mode-hook #'org-indent-mode)
