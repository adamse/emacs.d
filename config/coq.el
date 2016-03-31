;;; coq.el ---

(add-to-list 'load-path "/usr/local/opt/coq/lib/emacs/site-lisp")
(load-file (concat (file-name-directory load-file-name)
                   "packages/ProofGeneral/generic/proof-site.el"))

(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

(add-hook 'coq-mode-hook #'company-coq-initialize)


(provide 'coq)
