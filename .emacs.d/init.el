(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(unless package-archive-contents (package-refresh-contents))    ;; update packages
(package-initialize)



(use-package orderless
:ensure t
:custom
(completion-styles '(orderless basic)) ;; Add orderless for better matching
(completion-category-defaults nil)    ;; Allow orderless for all categories
)

;; Enable vertico
(use-package vertico
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 5) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(global-set-key (kbd "C-<return>") 'newline-and-indent)


(setq project-vc-extra-root-markers '(
                                    ".project"
                                    ".git"
                                    ))  ; xz-tools probably


(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("cf" . "src conf"))

(add-hook 'org-mode-hook 'satori-disable-line-numbers)
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'org-indent-mode)

(add-hook 'eshell-mode-hook 'satori-disable-line-numbers)

(defun satori-consult-rg-popup ()
  "Spawn a popup window to run `consult-ripgrep` in the home directory."
  (interactive)
  (let ((default-directory (expand-file-name "~/")))
    ;; Create a new frame for the popup
    (with-selected-frame (make-frame '((name . "Ripgrep Search")
                                       (width . 80)
                                       (height . 24)
                                       (minibuffer . t)))
      ;; Run consult-ripgrep in the new frame
      (consult-ripgrep))))

;--- Environment variables ---
;--- Editor Styling ---
(setq satori-font-size 200)                                   ;; font-size
;--- Themes ---
(setq satori-theme 'doom-outrun-electric)
;--- UI Elements ---
(setq satori-tool-bar 0)                                      ;; tool bar
(setq satori-menu-bar 0)                                      ;; menu bar
(setq satori-scroll-bar 0)                                    ;; scroll bar
(setq satori-fringe-mode-padding 0)                           ;; horizontal padding
;; --- General Settings ---
(setq satori-backups nil)
;; --- use-package ---
;; Maybe I should remove this and enable it for each package
(setq use-package-always-ensure t)                            ;; auto-install missing packages
;; --- Org Roam ---

(use-package doom-themes
    :ensure t
    :config
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    (doom-themes-org-config)
    )

(load-theme satori-theme t)

(set-face-attribute 'default nil :height satori-font-size)

;; --- modeline settings ---
(display-time-mode 1)                   ;; display time

(global-display-line-numbers-mode t)

(defun satori-disable-line-numbers ()
   (display-line-numbers-mode 0))

(use-package visual-fill-column
    :config
      (setq-default visual-fill-column-width 120)
      (setq-default visual-fill-column-center-text t  )
    )
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

(setq make-backup-files satori-backups)

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
:ensure t
:after vertico
:init
(marginalia-mode))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-initialize))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
<<<<<<< Updated upstream
   '(sudo-edit magit sass-mode lsp-ui web-mode visual-fill-column vertico tree-sitter-langs prettier org-roam org-bullets orderless marginalia lsp-mode exec-path-from-shell doom-themes consult company)))
=======
   '(eglot-jl vue-mode all-the-icons-dired vscode-icon dired-sidebar all-the-icons sudo-edit magit sass-mode lsp-ui web-mode visual-fill-column vertico tree-sitter-langs prettier org-roam org-bullets orderless marginalia lsp-mode exec-path-from-shell doom-themes consult company)))
>>>>>>> Stashed changes
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
