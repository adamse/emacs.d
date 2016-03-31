(defun god-update-cursor ()
  "Update my cursor."
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(defun god-toggle-on-overwrite ()
  "Toggle god-mode on overwrite-mode."
  (if (bound-and-true-p overwrite-mode)
      (god-local-mode-pause)
    (god-local-mode-resume)))
;; god-mode configuration

(use-package god-mode
  :ensure t
  :config

  (global-set-key (kbd "C-x C-1") 'delete-other-windows)
  (global-set-key (kbd "C-x C-2") 'split-window-below)
  (global-set-key (kbd "C-x C-3") 'split-window-right)
  (global-set-key (kbd "C-x C-0") 'delete-window)
  (global-set-key (kbd "<escape>") 'god-local-mode)

  (add-hook 'god-mode-enabled-hook 'god-update-cursor)
  (add-hook 'god-mode-disabled-hook 'god-update-cursor)
  (add-hook 'overwrite-mode-hook 'god-toggle-on-overwrite)
  (add-to-list 'god-exempt-major-modes 'message-mode)

  (god-mode)
  )

(provide 'god)
