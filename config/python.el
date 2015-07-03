;;; python.el ---

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)))


(provide 'python)
