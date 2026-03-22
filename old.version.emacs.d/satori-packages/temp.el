
;; (add-hook 'eshell-mode-hook 'satori-disable-line-numbers)

(setq use-package-always-ensure t)                            ;; auto-install missing packages



(defun satori-disable-line-numbers ()
   (display-line-numbers-mode 0))

