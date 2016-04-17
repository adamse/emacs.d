(use-package magit
  :ensure t
  :init

  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup))
  )
