;;; tex.el ---

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:

(require 'global)

(defun tex/build-view ()
  (interactive)
  (progn
    (let ((TeX-save-query nil))
      (TeX-save-document (TeX-master-file)))
    (setq build-proc (TeX-command "LaTeX" 'TeX-master-file -1))
    (set-process-sentinel  build-proc  'tex/build-sentinel)))

(defun tex/build-sentinel (process event)
  (if (string= event "finished\n")
      (TeX-view)
    (message "Errors! Check with C-`")))

(defun electric-pair ()
  "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
  (interactive)
  (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

;(add-hook 'LaTeX-mode-hook 'my-paredit-nonlisp)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-C") 'tex/build-view)))

(provide 'tex)
