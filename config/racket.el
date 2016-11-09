;;;; racket.el ---

;;;; Copyright (c) 2016 Adam Sandberg Eriksson. All rights reserved.

;;;; Code:

(use-package racket-mode
  :config
  (add-hook 'racket-mode-hook 'paredit-mode)
  (add-hook 'racket-repl-mode-hook 'paredit-mode))

(provide 'racket)
