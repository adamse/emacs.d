;;; writing.el ---

;; Copyright (c) 2016 Adam Sandberg Eriksson. All rights reserved.

;;; Code:


;; (use-package auctex
;;   :ensure t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(use-package org
  :config
  (add-hook 'org-mode-hook 'flyspell-mode)
  )

(use-package markdown-mode
  :ensure t)
