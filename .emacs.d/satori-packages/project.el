(use-package project
  :ensure nil ;; project.el is built into Emacs, so no need to install
 ;; :after (consult)
  :bind-keymap ("C-c p" . project-prefix-map) ;; Bind project commands to C-c p
  :bind (:map project-prefix-map
              ("r" . consult-grep)
              )
  :custom
  (project-list-file "~/.emacs.d/projects") ;; Save project list here
  (project-vc-extra-root-markers '(".project" ".git")) ;; Custom project markers
  :config     
  ;; Helper to register a directory as a project
  )
