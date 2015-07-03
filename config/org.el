(defun org-fast-task-reclock (&optional no-clock)
  "Quickly make a new task and clock into it."
  (interactive "P")
  (let ((file (ido-completing-read "Org-file: " (reverse org-agenda-files))))
    (find-file file)
    (let ((headings (list)))
      (save-excursion
        (goto-char (point-min))
        (while (search-forward-regexp "^\\*" nil t)
          (destructuring-bind (_ _ status _ title _) (org-heading-components)
            (when (not status)
              (push title headings))
            (end-of-line))))
      (let ((heading (ido-completing-read "Project: " headings))
            (found nil))
        (goto-char (point-min))
        (while (and (not found)
                    (search-forward-regexp "^\\*" nil t))
          (destructuring-bind (_ _ status _ title _) (org-heading-components)
            (when (string= heading title)
              (setq found t)
              (org-insert-todo-heading-respect-content)
              (org-metaright 1)
              (org-todo "TODO")
              (insert (read-from-minibuffer "Task title: "))
              (unless no-clock (org-clock-in)))
            (end-of-line)))))))


(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)))

; use xelatex :D
(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f")) ;; for multiple passes
