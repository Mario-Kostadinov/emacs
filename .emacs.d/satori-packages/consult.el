(use-package consult
:ensure t
:bind (
       ("C-s" . consult-line)         ;; Line search, similar to Swiper
       ("C-x b" . consult-buffer)     ;; Enhanced buffer switching
       ;;("C-x b o" . consult-buffer-other-window)
       ("M-g g" . consult-goto-line)  ;; Go to a specific line
       ;;("C-c p r" . consult-ripgrep)    ;; Search files with ripgrep
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
