;;; haskell-new.el ---

;;; Code:


(defun haskell-insert-doc ()
  "Insert the documentation syntax."
  (interactive)
  (unless (= (line-beginning-position)
             (line-end-position))
    (shm/backward-paragraph))
  (unless (= (line-beginning-position)
             (line-end-position))
    (save-excursion (insert "\n")))
  (insert "-- | "))

(defun haskell-auto-insert-module-template ()
  "Insert a module template for the newly created buffer."
  (interactive)
  (when (and (= (point-min)
                (point-max))
             (buffer-file-name))
    (insert
     "-- | "
     "\n"
     "module "
     )
    (let ((name (haskell-guess-module-name)))
      (if (string= name "")
          (progn (insert "Main")
                 (shm-evaporate (- (point) 5)
                                (point)))
        (insert name)))
    (insert " where"
            "\n"
            "\n")
    (goto-char (point-min))
    (forward-char 4)
    (god-mode)))

(defun haskell-insert-undefined ()
  "Insert undefined."
  (interactive)
  (if (and (boundp 'structured-haskell-mode)
           structured-haskell-mode)
      (shm-insert-string "undefined")
    (insert "undefined")))

(use-package haskell-mode
  :ensure t
  :bind
  (("C-c C-u" . haskell-insert-undefined)
   ("C-c C-a" . haskell-insert-doc)

   ;; :map interactive-haskell-mode-map
   ("C-`" . haskell-interactive-bring)
   ("C-c C-t" . haskell-process-do-type)
   ("C-c c" . haskell-process-cabal)
   ("C-c C-c" . haskell-process-cabal-build)
   )

  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

  (use-package haskell-interactive-mode
    :demand
    :bind
    (("C-c c" . haskell-process-cabal)))

  (use-package hindent
    :bind
    (:map
     haskell-mode-map
     ("C-c i" . hindent/reformat-dec))))

(use-package ghc-dev-mode)
