;; Standard libraries needed

(require 'cl)
(require 'package)

;; Packages setup

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Theme
(use-package solarized-theme
  :ensure t)

;; Packages and configs to load

(use-package smex
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package unicode-fonts
  :ensure t)

(use-package ace-jump-mode
  :ensure t)

(use-package ag
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package reveal-in-osx-finder
  :ensure t)

(use-package paredit
  :ensure t)

(use-package elisp-slime-nav
  :ensure t)

(use-package goto-last-change
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "LIBRARY_PATH")
  (exec-path-from-shell-copy-env "DYLD_FALLBACK_LIBRARY_PATH")
  )

(use-package gist
  :ensure t)

;;; God mode

(use-package god-mode
  :ensure t
  :demand
  :bind
  (("C-x C-1"	. delete-other-windows)
   ("C-x C-2"	. split-window-below)
   ("C-x C-3"	. split-window-right)
   ("C-x C-0"	. delete-window)
   ("<escape>"	. god-local-mode)
   ("C->"	. end-of-buffer)
   ("C-<"	. beginning-of-buffer))

  :config
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

  (add-hook 'god-mode-enabled-hook 'god-update-cursor)
  (add-hook 'god-mode-disabled-hook 'god-update-cursor)
  (add-hook 'overwrite-mode-hook 'god-toggle-on-overwrite)

  (setq god-exempt-major-modes
        `(message-mode
          debugger-mode
          haskell-presentation-mode
          Custom-mode
          completion-list-mode
          TeX-output-mode
          special-mode
          . ,god-exempt-major-modes))

  (god-mode))

;;; Agda mode

(use-package agda2-mode
  :load-path "/Users/adam/local/agda/.stack-work/install/x86_64-osx/lts-7.0/8.0.1/share/x86_64-osx-ghc-8.0.1/Agda-2.6.0/emacs-mode/"
  :mode ("\\.l?agda\\'" . agda2-mode)
  :bind
  (:map agda2-mode-map
   ("M-n" . agda2-next-goal)
   ("M-p" . agda2-previous-goal)
   ("s-]" . agda2-goto-definition-keyboard)
   ("s-[" . agda2-go-back)
   ))

(use-package agda-input)
(use-package eri)

;;; Lpaste

(use-package lpaste
  :load-path "packages/lpaste/")


;;; Haskell

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
  (:map haskell-mode-map
        ("C-c C-u"	. haskell-insert-undefined)
        ("C-c C-a"	. haskell-insert-doc)

        ;; interactive-haskell-mode
        ("C-`"		. haskell-interactive-bring)
        ("C-c C-t"	. haskell-process-do-type)
        ("C-c c"	. haskell-process-cabal)
        ("C-c C-c"	. haskell-process-cabal-build)
        )

  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'hindent-mode)

  (use-package haskell-interactive-mode
    :bind
    (:map haskell-interactive-mode-map
          ("C-c c" . haskell-process-cabal)))

  (use-package hindent
    :load-path "packages/hindent/elisp")
  (use-package ghc-dev-mode
    :load-path "packages/ghc-dev-mode")
  )

;;; HOL mode

;; (use-package hol-mode
;;   :load-path "~/src/cakeml/HOL/tools/"
;;   :config
;;   (defun hol-mark-line-tactic ()
;;     "Marks the tactic at current line"
;;     (interactive)
;;     (deactivate-mark)
;;     (move-beginning-of-line nil)
;;     (skip-chars-forward " \\\\>-")        ; skip chaining tacticts
;;     (if (and (looking-at "(")
;;              (= (line-number-at-pos)
;;                 (save-excursion (forward-list)
;;                                 (line-number-at-pos))))
;;         (progn
;;           (push-mark)
;;         (forward-list))
;;       (if (looking-at "(")
;;           (skip-chars-forward "("))
;;       (push-mark)
;;       (move-end-of-line nil))
;;     (setq mark-active t))

;;   (defun hol-eval-line-tactic ()
;;     "Highlights and evaluates the current line as a tactic in the HOL buffer."
;;     (interactive)
;;     (hol-mark-line-tactic)
;;     (copy-region-as-hol-tactic (region-beginning) (region-end) nil))

;;   (define-key hol-map "\M-e" 'hol-eval-line-tactic)

;;   (define-key sml-mode-map (kbd "TAB") 'eri-indent)
;;   (define-key sml-mode-map (kbd "S-TAB") 'eri-indent-reverse)

;;   (add-hook
;;    'sml-mode-hook
;;    (lambda ()
;;      (kill-local-variable 'electric-indent-chars)
;;      (kill-local-variable 'electric-layout-rules)
;;      (setq electric-indent-inhibit t)))
;;   )

;;; Lisp

(defun conditionally-enable-paredit-mode ()
  "enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(defun paredit-delete-indentation ()
  "Delete indentation and re-indent."
  (interactive)
  (delete-indentation)
  (paredit-reindent-defun))

(defun paredit-backward-delete. ()
  "A less enraging `paredit-backward-delete'."
  (interactive)
  (if (region-active-p)
      (delete-region (region-beginning)
                     (region-end))
    (call-interactively 'paredit-backward-delete)))

(defun emacs-lisp-expand-clever ()
  "Cleverly expand symbols with normal dabbrev-expand, but also
if the symbol is -foo, then expand to module-name-foo."
  (interactive)
  (if (save-excursion
        (backward-sexp)
        (when (looking-at "#?'") (search-forward "'"))
        (looking-at "-"))
      (if (eq last-command this-command)
          (call-interactively 'dabbrev-expand)
        (let ((module-name (emacs-lisp-module-name)))
          (progn
            (save-excursion
              (backward-sexp)
              (when (looking-at "#?'") (search-forward "'"))
              (unless (string= (buffer-substring-no-properties
                                (point)
                                (min (point-max) (+ (point) (length module-name))))
                               module-name)
                (insert module-name)))
            (call-interactively 'dabbrev-expand))))
    (call-interactively 'dabbrev-expand)))

(defun emacs-lisp-module-name ()
  "Search the buffer for `provide' declaration."
  (save-excursion
    (goto-char (point-min))
    (when (search-forward-regexp "^(provide '" nil t 1)
      (symbol-name (symbol-at-point)))))

(defun emacs-lisp-module-template ()
  (interactive)
  (when (and (buffer-file-name)
             (= (point-min)
                (point-max)))
    (let ((module-name
           (replace-regexp-in-string
            "\\.el$" ""
            (file-name-nondirectory (buffer-file-name)))))
      (insert (format ";;;; %s.el --- $DESC$

;;;; Copyright (c) 2016 Adam Sandberg Eriksson. All rights reserved.

;;;; Code:

%s

\(provide '%s)" module-name (if (string-match "^shm-" module-name)
                                "(require 'shm-core)\n\n" "") module-name))
      (search-backward "$DESC$")
      (delete-region (point)
                     (line-end-position)))))

(defun emacs-lisp-return-or-backslash ()
  "Return to previous point in god-mode."
  (interactive)
  (if god-local-mode
      (call-interactively 'god-mode-self-insert)
    (call-interactively 'paredit-backslash)))

(defun paredit-kill-sexp ()
  "Kill the sexp at point."
  (interactive)
  (if (eq last-command 'kill-region)
      (call-interactively 'kill-sexp)
    (cond
     ((paredit-in-string-p)
      (paredit-backward-up)
      (call-interactively 'kill-sexp))
     ((paredit-inside-sexp-p)
      (paredit-backward)
      (call-interactively 'kill-sexp))
     ((paredit-start-of-sexp-p)
      (call-interactively 'kill-sexp))
     (t
      (paredit-backward)
      (call-interactively 'kill-sexp)))))

(defun paredit-delete-sexp ()
  "Delete the sexp at point."
  (interactive)
  (cond
   ((paredit-in-comment-p)
    (call-interactively 'delete-char))
   ;; Strings don't behave the same as normal sexps in paredit.
   ((paredit-in-string-p)
    (delete-region (save-excursion (paredit-backward-up)
                                   (point))
                   (save-excursion (paredit-backward-up)
                                   (paredit-forward)
                                   (point))))
   ((paredit-inside-sexp-p)
    (delete-region (save-excursion (paredit-backward)
                                   (point))
                   (save-excursion (paredit-forward)
                                   (point))))
   ((paredit-start-of-sexp-p)
    (delete-region (point)
                   (save-excursion (paredit-forward)
                                   (point))))
   ;; Otherwise we're at the end of a sexp.
   (t
    (delete-region (save-excursion (paredit-backward)
                                   (point))
                   (save-excursion (paredit-backward)
                                   (paredit-forward)
                                   (point))))))

(defun paredit-inside-sexp-p ()
  "Are we inside the bounds of a sexp?"
  (= (save-excursion (paredit-forward)
                     (point))
     (save-excursion (paredit-backward)
                     (paredit-forward)
                     (point))))

(defun paredit-start-of-sexp-p ()
  "Are we at the start of a sexp?"
  (= (save-excursion (paredit-forward)
                     (paredit-backward)
                     (point))
     (point)))

(defun byte-compile-reload-dir ()
  "Byte-compile and reload everything."
  (interactive)
  (let ((byte-compile-warnings '(free-vars unresolved callargs redefine make-local mapcar constants suspicious)))
    (loop for file in (directory-files (file-name-directory (or load-file-name
                                                                (buffer-file-name)))
                                       nil
                                       "^[a-z0-9-]+\\.el$")
          do (byte-recompile-file file t 0 t))))

(use-package emacs-lisp-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'emacs-lisp-module-template)
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

  (use-package paredit-mode
    :bind
    (:map paredit-mode-map
          ("\\"       . emacs-lisp-return-or-backslash)
          ("<delete>" . paredit-delete-sexp)
          ("C-M-k"    . paredit-kill-sexp)
          ("M-k"      . paredit-kill-sexp)
          ("DEL"      . paredit-backward-delete.)
          ("M-^"      . paredit-delete-indentation)
          ("M-a"      . paredit-backward-up)
	  ))
  )


;;; Magit

(use-package magit
  :ensure t
  :init

  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup))
  )

;;; writing

(use-package LaTeX-mode
  :config
  (add-hook 'LaTeX-mode-hook 'flyspell-mode))

(use-package org
  :config
  (add-hook 'org-mode-hook 'flyspell-mode)
  )

(use-package markdown-mode)

;; Global config

(require 'uniquify)
(require 'org-agenda)
(require 'flyspell)
(require 'unicode-fonts)

;; Fundamental functions

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun select-current-line ()
  "Select the current line."
  (interactive)
  (execute-kbd-macro [?\C-e S-home]))

(defun set-auto-saves ()
  "Put autosave files (ie #foo#) in one place, *not*
 scattered all over the file system!"
  (defvar autosave-dir
    (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

  (make-directory autosave-dir t)

  (defun auto-save-file-name-p (filename)
    (string-match "^#.*#$" (file-name-nondirectory filename)))

  (defun make-auto-save-file-name ()
    (concat autosave-dir
            (if buffer-file-name
                (concat "#" (file-name-nondirectory buffer-file-name) "#")
              (expand-file-name
               (concat "#%" (buffer-name) "#")))))

  (defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
  (setq backup-directory-alist (list (cons "." backup-dir))))

(defun auto-chmod ()
  "If we're in a script buffer, then chmod +x that script."
  (and (save-excursion
         (save-restriction
           (widen)
           (goto-char (point-min))
           (save-match-data
             (looking-at "^#!"))))
       (shell-command (concat "chmod u+x " buffer-file-name))
       (message (concat "Saved as script: " buffer-file-name))))

(defun find-alternate-file-with-sudo ()
  "Re-open with sudo."
  (interactive)
  (let ((point (point)))
    (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (goto-char point)))

(defmacro bol-with-prefix (function)
  "Define a new function which calls FUNCTION.
Except it moves to beginning of line before calling FUNCTION when
called with a prefix argument. The FUNCTION still receives the
prefix argument."
  (let ((name (intern (format "endless/%s-BOL" function))))
    `(progn
       (defun ,name (p)
         ,(format
           "Call `%s', but move to BOL when called with a prefix argument."
           function)
         (interactive "P")
         (let ((col (current-column)))
           (when p
             (forward-line 0))
           (call-interactively ',function)
           (when p
             (forward-char col))))
       ',name)))

;; Global keybindings

(global-set-key [remap org-kill-line] (bol-with-prefix org-kill-line))
(global-set-key [remap kill-line] (bol-with-prefix kill-line))

(global-set-key (kbd "M-z") 'zap-up-to-char-repeatable)
(global-set-key (kbd "M-Q") 'unfill-paragraph)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-x") 'goto-last-change)
(global-set-key (kbd "C-x C-TAB") 'indent-rigidly)
(global-set-key (kbd "C-t") 'replace-regexp)
(global-set-key (kbd "C-z") 'ido-switch-buffer)
(global-set-key (kbd "C-,") 'ace-jump-char-mode)

(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "<left>") 'windmove-left)
(global-set-key (kbd "<right>") 'windmove-right)
(global-set-key (kbd "<up>") 'windmove-up)
(global-set-key (kbd "<down>") 'windmove-down)
(global-set-key (kbd "s-§") 'other-frame)

(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; Disable default settings

(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq kmacro-execute-before-append nil)

(set-default 'tags-case-fold-search nil)

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Enable cool modes

(ido-mode 1)
(global-font-lock-mode 1)

(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(set-auto-saves)

;; Default mode settings

(setq default-major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq ido-ignore-files
      '("\\.dyn_hi$"
        "\\.dyn_o$"
        "\\.hi$"
        "\\.o$"
        "\\.tags$"
        "^\\.ghci$"
        "\\.agdai$"))

(setq ido-max-directory-size 200000)


(setq tab-width 2)
(setq scroll-step 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq require-final-newline t)

;; Hooks

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'auto-chmod)
(add-hook 'shell-mode-hook 'set-ansi-colors)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
(add-hook 'ielm-mode-hook 'elisp-slime-nav-mode)


;; Auto-loads

(add-to-list 'auto-mode-alist (cons "\\.el\\'" 'emacs-lisp-mode))
(add-to-list 'auto-mode-alist (cons "\\.md\\'" 'markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.markdown\\'" 'markdown-mode))

;; Environment settings

(set-language-environment "UTF-8")

;; Faces

(set-default-font "-apple-PragmataPro-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
(set-fontset-font "fontset-default" 'unicode "PragmataPro")
;(set-fontset-font "fontset-default" 'unicode "Symbola")

;; Fix emoji
(setq unicode-fonts-block-font-mapping
      '(("Emoticons"
	 ("Apple Color Emoji" "Symbola" "Quivira")))
      unicode-fonts-fontset-names '("fontset-default"))

(unicode-fonts-setup)

;; Uniquify

(setq uniquify-buffer-name-style (quote post-forward-angle-brackets))


;; Start server

(server-start)

;; Custom space

(setq custom-file "~/.emacs.d/custom-variables.el")
(load custom-file)
