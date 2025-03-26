(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(unless package-archive-contents (package-refresh-contents))    ;; update packages
(package-initialize)

(add-hook 'org-mode-hook 'satori-disable-line-numbers)
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'org-indent-mode)

(add-hook 'eshell-mode-hook 'satori-disable-line-numbers)

;; --- General Settings ---

;; --- use-package ---
;; Maybe I should remove this and enable it for each package
(setq use-package-always-ensure t)                            ;; auto-install missing packages

(global-display-line-numbers-mode t)

(defun satori-disable-line-numbers ()
   (display-line-numbers-mode 0))

(use-package visual-fill-column
    :config
      (setq-default visual-fill-column-width 120)
      (setq-default visual-fill-column-center-text t  )
    )
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
:ensure t
:after vertico
:init
(marginalia-mode))

(load-file "~/projects/emacs/.emacs.d/satori-packages/shells.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/backups.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/completion.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/themes.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/modeline.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/eldoc.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/consult.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/ui-elements.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/autocomplete.el")
;; Project Management
(load-file "~/projects/emacs/.emacs.d/satori-packages/project.el")
;; Git
(load-file "~/projects/emacs/.emacs.d/satori-packages/magit.el")
;; Org Roam ;;
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-roam.el")
;; IDE SETUP
(load-file "~/projects/emacs/.emacs.d/satori-packages/lsp.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/webmode.el")
;;(load-file "~/projects/emacs/.emacs.d/satori-packages/prettier.el")
;;(load-file "~/projects/emacs/.emacs.d/satori-packages/treesitter.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/sassmode.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/ide/ide.el")
