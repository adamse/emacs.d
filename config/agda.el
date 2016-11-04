;; Agda

(require 'cl)

(defconst agda-mode-directory
  "/Users/adam/local/agda/.stack-work/install/x86_64-osx/lts-7.0/8.0.1/share/x86_64-osx-ghc-8.0.1/Agda-2.6.0/emacs-mode/"
  ;; (file-name-directory (shell-command-to-string "agda-mode locate"))
  "Location of Agda emacs mode")

(add-to-list 'load-path agda-mode-directory)

(use-package agda2-mode
  :mode ("\\.l?agda\\'" . agda2-mode)
  :bind
  (:map agda2-mode-map
   ("M-n" . agda2-next-goal)
   ("M-p" . agda2-previous-goal)
   ("s-]" . agda2-goto-definition-keyboard)
   ("s-[" . agda2-go-back)
   ))

;;; make available
(use-package agda-input)
(use-package eri)

(provide 'agda)
