;; Enable vertico
(use-package vertico
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 5) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package orderless
:ensure t
:custom
(completion-styles '(orderless basic)) ;; Add orderless for better matching
(completion-category-defaults nil)    ;; Allow orderless for all categories
)
