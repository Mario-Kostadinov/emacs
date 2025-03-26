(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-styling.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-total-progress-in-buffer.el")

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("cf" . "src conf"))
