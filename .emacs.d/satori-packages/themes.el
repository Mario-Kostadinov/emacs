;--- Themes ---
(setq satori-theme 'doom-outrun-electric)

(use-package doom-themes
    :ensure t
    :config
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    (doom-themes-org-config)
    )

(load-theme satori-theme t)
