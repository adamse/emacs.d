;; Agda

(defvar agda-mode-location (shell-command-to-string "agda-mode locate"))

(load-file (let ((coding-system-for-read 'utf-8))
             agda-mode-location))

; Load agda input mode so that I can enter unicode everywhere!
(load-file (let ((coding-system-for-read 'utf-8))
             (concat (file-name-directory agda-mode-location) "agda-input.el")))

(define-key agda2-mode-map (kbd "M-n") 'agda2-next-goal)
(define-key agda2-mode-map (kbd "M-p") 'agda2-previous-goal)
(define-key agda2-mode-map [s-mouse-1] 'agda2-goto-definition-mouse)

(provide 'agda)
