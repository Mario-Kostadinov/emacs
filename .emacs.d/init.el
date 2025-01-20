;--- Environment variables ---
;--- Editor Styling ---
(setq satori-font-size 200)                                   ;; font-size
;--- Themes ---
(setq satori-theme 'tango-dark)
;--- UI Elements ---
(setq satori-tool-bar 0)                                      ;; tool bar
(setq satori-menu-bar 0)                                      ;; menu bar
(setq satori-scroll-bar 0)                                    ;; scroll bar
(setq satori-fringe-mode-padding 0)                           ;; horizontal padding
;; --- General Settings ---
(setq satori-backups nil)
;; --- use-package ---
(setq use-package-always-ensure t)                            ;; auto-install missing packages
;; --- Org Roam ---
(setq satori-org-roam-directory "~/projects/satori-notes")    ;; org roam notes directory
;; --- project.el ---

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(unless package-archive-contents (package-refresh-contents))    ;; update packages
(package-initialize)

(load-theme satori-theme t)

(set-face-attribute 'default nil :height satori-font-size)

(tool-bar-mode satori-tool-bar)
(menu-bar-mode satori-menu-bar)			
(scroll-bar-mode satori-scroll-bar)
(set-fringe-mode satori-fringe-mode-padding)

;; --- modeline settings ---
(display-time-mode 1)                   ;; display time

(global-display-line-numbers-mode t)

(defun satori-disable-line-numbers ()
   (display-line-numbers-mode 0))

(setq make-backup-files satori-backups)

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
:ensure t
:after vertico
:init
(marginalia-mode))

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

(use-package consult
:ensure t
:bind (
       ("C-s" . consult-line)         ;; Line search, similar to Swiper
       ("C-x b" . consult-buffer)     ;; Enhanced buffer switching
       ("M-g g" . consult-goto-line)  ;; Go to a specific line
       ("C-c k" . consult-ripgrep)    ;; Search files with ripgrep
       ;;("C-c n" . consult-find)
       )      ;; Find files in the current directory
:custom
(consult-preview-key 'any)            ;; Preview results as you navigate
(consult-narrow-key "<")              ;; Narrow options while searching
:init
;; Configure project root detection
(setq consult-project-root-function
      (lambda ()
	(when-let (project (project-current))
	  (car (project-roots project))))))

(use-package org-roam
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        ("C-c d c" . org-roam-dailies-capture-today)
        ("C-c d s" . org-roam-dailies-goto-today)
        )
  :config
  (setq org-roam-directory satori-org-roam-directory))

(use-package org-bullets
:after org
:hook (org-mode . org-bullets-mode)
:custom
(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Increase the size of various headings
(set-face-attribute 'org-document-title nil :font "Cantarell" :weight 'bold :height 1.3)

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'medium :height (cdr face)))

(add-hook 'org-mode-hook 'satori-disable-line-numbers)

(add-hook 'eshell-mode-hook 'satori-disable-line-numbers)

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
