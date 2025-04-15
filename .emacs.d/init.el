(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(unless package-archive-contents (package-refresh-contents))    ;; update packages
(package-initialize)

(load-file "~/projects/emacs/.emacs.d/satori-packages/temp.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/general.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/external/marginalia.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/external/visual-fill-column.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/shells.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/backups.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/completion.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/themes.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/modeline.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/eldoc.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/consult.el")
(load-file "~/projects/emacs/.emacs.d/satori-packages/ui-elements.el")
;; (load-file "~/projects/emacs/.emacs.d/satori-packages/autocomplete.el")
;; Project Management
(load-file "~/projects/emacs/.emacs.d/satori-packages/project.el")
;; Git
(load-file "~/projects/emacs/.emacs.d/satori-packages/magit.el")
;; Org Roam ;;
(load-file "~/projects/emacs/.emacs.d/satori-packages/org/org-roam.el")
;; IDE SETUP

(load-file "~/projects/emacs/.emacs.d/satori-packages/ide/ide.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     default))
 '(package-selected-packages
   '(all-the-icons-dired company consult dired-sidebar doom-themes
			 eglot-jl exec-path-from-shell lsp-ui magit
			 marginalia orderless org-bullets org-roam
			 prettier request restclient sass-mode
			 sudo-edit tree-sitter tree-sitter-langs
			 vertico visual-fill-column vscode-icon vterm
			 vue-mode web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
