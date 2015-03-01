;;; tex.el ---

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:

(defun tex/build-view ()
  (interactive)
  (if (buffer-modified-p)
      (progn
        (let ((TeX-save-query nil))
          (TeX-save-document (TeX-master-file)))
        (setq build-proc (TeX-command "LaTeX" 'TeX-master-file -1))
        (set-process-sentinel  build-proc  'tex/build-sentinel))
    (TeX-view)))

(defun tex/build-sentinel (process event)
  (if (string= event "finished\n")
      (TeX-view)
    (message "Errors! Check with C-`")))

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-c C-C") 'tex/build-view)))

(provide 'tex)
