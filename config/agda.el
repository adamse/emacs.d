;; Agda

(defvar agda-mode-location (shell-command-to-string "agda-mode locate"))

(load-file (let ((coding-system-for-read 'utf-8))
             agda-mode-location))

(require 'agda2-mode)
(require 'agda-input)

(define-key agda2-mode-map (kbd "M-n") 'agda2-next-goal)
(define-key agda2-mode-map (kbd "M-p") 'agda2-previous-goal)
(define-key agda2-mode-map [s-mouse-1] 'agda2-goto-definition-mouse)
(define-key agda2-mode-map (kbd "s-]") 'agda2-goto-definition-keyboard)
(define-key agda2-mode-map (kbd "s-[") 'agda2-go-back)


(provide 'agda)
