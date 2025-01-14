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

(package-initialize)
(unless package-archive-contents (package-refresh-contents))    ;; update packages

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

(use-package helm
           :ensure t
           :config
           (helm-mode 1)
           (setq helm-M-x-fuzzy-match t
                 helm-buffers-fuzzy-matching t
                 helm-recentf-fuzzy-match t))

         ;; Keybindings
         (global-set-key (kbd "C-x C-f") 'helm-find-files)  ;; Find files
         (global-set-key (kbd "C-M-j") 'helm-buffers-list)  ;; Buffer list
         (global-set-key (kbd "M-x") 'helm-M-x)            ;; Replace M-x with Helm

         (with-eval-after-load 'helm
           (define-key helm-map (kbd "C-j") 'helm-next-line)
           (define-key helm-map (kbd "C-k") 'helm-previous-line)
           (define-key helm-map (kbd "C-h") 'helm-find-files-up-one-level)
           (define-key helm-map (kbd "C-l") 'helm-execute-persistent-action))

         (with-eval-after-load 'helm-buffers
             (define-key helm-find-files-map (kbd "C-l") 'helm-execute-persistent-action)
           (define-key helm-buffer-map (kbd "C-h") 'helm-keyboard-quit)
     (define-key helm-buffer-map (kbd "C-d") 'helm-buffer-run-kill-persistent)
   (define-key helm-buffer-map (kbd "C-o") 'helm-maybe-exit-minibuffer)
(define-key helm-buffer-map (kbd "C-n") 'helm-buffer-switch-other-window)
       )

 (with-eval-after-load 'helm-files
   (define-key helm-find-files-map (kbd "C-p") 'helm-execute-persistent-action))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (setq select-enable-clipboard t)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
)

(use-package org-roam
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        ("C-c d c" . org-roam-dailies-capture-today)
        ("C-c d s" . org-roam-dailies-goto-today)
        )
  :config
  (setq org-roam-directory satori-org-roam-directory))

(add-hook 'org-mode-hook 'satori-disable-line-numbers)

(add-hook 'eshell-mode-hook 'satori-disable-line-numbers)
