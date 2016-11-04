(defun god-update-cursor ()
  "Update my cursor."
  (setq cursor-type
        (if (or god-local-mode buffer-read-only)
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
  :bind
  (("C-x C-1" . delete-other-windows)
   ("C-x C-2" . split-window-below)
   ("C-x C-3" . split-window-right)
   ("C-x C-0" . delete-window)
   ("<escape>" . god-local-mode))

  :config
  (add-hook 'god-mode-enabled-hook 'god-update-cursor)
  (add-hook 'god-mode-disabled-hook 'god-update-cursor)
  (add-hook 'overwrite-mode-hook 'god-toggle-on-overwrite)
  (add-to-list 'god-exempt-major-modes 'message-mode)
  (add-to-list 'god-exempt-major-modes 'debugger-mode)
  (add-to-list 'god-exempt-major-modes 'haskell-presentation-mode)
  (add-to-list 'god-exempt-major-modes 'Custom-mode)

  (god-mode)
  )

(provide 'god)
