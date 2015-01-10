;;; coq.el ---

; Load coq-mode
(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

; Load ProofGeneral



(provide 'coq)
