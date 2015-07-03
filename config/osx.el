;;; osx.el ---

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:

(exec-path-from-shell-copy-env "LIBRARY_PATH")
(exec-path-from-shell-copy-env "DYLD_FALLBACK_LIBRARY_PATH")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq ns-right-alternate-modifier nil)

(provide 'osx)
