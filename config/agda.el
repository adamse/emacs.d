;; Agda

(defvar agda-mode-location (shell-command-to-string "agda-mode locate"))

(load-file (let ((coding-system-for-read 'utf-8))
             agda-mode-location))

; Load agda input mode so that I can enter unicode everywhere!
(load-file (let ((coding-system-for-read 'utf-8))
             (concat (file-name-directory agda-mode-location) "agda-input.el")))

(add-hook 'agda2-mode-hook
          (lambda ()
            (local-set-key (kbd "M-n") 'agda2-next-goal)
            (local-set-key (kbd "M-p") 'agda2-previous-goal)
            (local-set-key (kbd "C-c C-g") 'agda2-give)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" "."))))

(provide 'agda)
