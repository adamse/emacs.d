;;; coq.el ---

; define coq mode
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

(add-hook 'coq-mode-hook #'company-coq-initialize)


(provide 'coq)
