;; Agda

(defvar agda-mode-directory
  (let ((coding-system-for-read 'utf-8))
    (file-name-directory (shell-command-to-string "agda-mode locate"))))

(add-to-list 'load-path agda-mode-directory)

(use-package agda2-mode
  :mode ("\\.l?agda\\'" . agda2-mode)
  :bind
  (("M-n" . agda2-next-goal)
   ("M-p" . agda2-previous-goal)
   ("s-]" . agda2-goto-definition-keyboard)
   ("s-[" . agda2-go-back)
   ))

;;; make available
(use-package agda-input)

(provide 'agda)
