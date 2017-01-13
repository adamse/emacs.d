;;; osx.el ---

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:

(exec-path-from-shell-copy-env "LIBRARY_PATH")
(exec-path-from-shell-copy-env "DYLD_FALLBACK_LIBRARY_PATH")

(defun middle-click (click)
   (interactive "e")
   (let ((event (event-start click))
        (prefix-arg current-prefix-arg))
     (call-interactively (key-binding (vector (list 'mouse-2 event)) t))))

(defun middle-click (click &optional arg)
  (interactive "e\nP")
  (let ((event (event-start click)))
    ;; handle error if the function doesn't use the prefix
    (condition-case nil
        (funcall (key-binding (vector (list 'mouse-2 event))) click arg)
      (error (funcall (key-binding (vector (list 'mouse-2 event))) click)))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (global-set-key (kbd "<s-mouse-1>") 'middle-click))

(provide 'osx)
