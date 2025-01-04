;--- Environment variables ---
;--- Editor Styling ---
(setq satori-font-size 160)                                   ;; font-size
;--- UI Elements ---
(setq satori-tool-bar 0)                                      ;; tool bar
(setq satori-menu-bar 0)                                      ;; menu bar
(setq satori-scroll-bar 0)                                    ;; scroll bar
(setq satori-fringe-mode-padding 0)                           ;; horizontal padding
;; --- use-package ---
(setq use-package-always-ensure t)                            ;; auto-install missing packages
;; --- Org Roam ---
(setq satori-org-roam-directory "~/projects/satori-notes")

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents (package-refresh-contents))    ;; update packages

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



(add-hook 'eshell-mode-hook 'satori-disable-line-numbers)

(add-hook 'org-mode-hook 'satori-disable-line-numbers)

(use-package org-roam
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        ("C-c d c" . org-roam-dailies-capture-today)
        ("C-c d s" . org-roam-dailies-goto-today)
        )
  :config
  (setq org-roam-directory satori-org-roam-directory))
