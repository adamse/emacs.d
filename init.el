;; Standard libraries needed

(require 'cl)
(require 'package)

; Packages setup

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Packages and configs to load

(defvar my-packages
  '(auctex
    ghc ; ghc-mod mode
    company
    company-ghc
    git-commit-mode
    git-rebase-mode
    gitconfig-mode
    gitignore-mode
    matlab-mode))

;; Install packages

(defun elpa-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (elpa-packages-installed-p)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Packages in .emacs.d

(defvar packages
  '(god-mode
    paredit
    exec-path-from-shell
    haskell-mode
    smex
    magit
    goto-last-change
    ace-jump-mode
    markdown-mode
    pandoc-mode
    dash
    elisp-slime-nav
    lpaste
    echo-keys
    align-by-current-symbol
    ag
    goto-last-point
    github-urls
    s
    hamlet-mode
    number
    hide-region
                                        ;    ats-mode
    multiple-cursors
    projects-mode
    color-theme
    color-theme-solarized
    flycheck
    reveal-in-finder
    expand-region)
  "Packages whose location follows the
  packages/package-name/package-name.el format.")

(defvar custom-load-paths
  '("structured-haskell-mode/elisp"
    "hindent/elisp"
    "git-modes")
  "Custom load paths that don't follow the normal
  package-name/module-name.el format.")

(defvar configs
  '("global"
    "god"
    "agda"
    "coq"
    "haskell"
    "erc"
    "email"
    "lisp"
    "markdown"
    "org")
  "Configuration files that follow the config/foo.el file path
  format.")

;; Load packages

(loop for location in custom-load-paths
      do (add-to-list 'load-path
                      (concat (file-name-directory (or load-file-name
                                                       (buffer-file-name)))
                              "packages/"
                              location)))

(add-to-list 'load-path "/usr/local/opt/coq/lib/emacs/site-lisp")
(load-file (concat (file-name-directory load-file-name)
                   "packages/ProofGeneral/generic/proof-site.el"))

(loop for name in packages
      do (progn (unless (fboundp name)
                  (add-to-list 'load-path
                               (concat (file-name-directory (or load-file-name
                                                                (buffer-file-name)))
                                       "packages/"
                                       (symbol-name name)))
                  (require name))))

;; Setup path for OS X

(exec-path-from-shell-copy-env "LIBRARY_PATH")
(exec-path-from-shell-copy-env "DYLD_LIBRARY_PATH")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Emacs configurations

(loop for name in configs
      do (load (concat (file-name-directory load-file-name)
                       "config/"
                       name ".el")))

;; Mode initializations

(smex-initialize)
(god-mode)
(color-theme-solarized-light)
(goto-last-point-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" ".")))
 '(company-ghc-show-info t)
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-notify-p t)
 '(haskell-process-args-ghci (quote nil))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-do-cabal-format-string ":!cd %s && unset GHC_PACKAGE_PATH && %s")
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(haskell-process-suggest-hoogle-imports nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-style "chris-done")
 '(safe-local-variable-values (quote ((Tex-master . "ass") (haskell-indent-spaces . 4) (haskell-indent-spaces . 2) (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
 '(send-mail-function (quote smtpmail-send-it))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-hdevtools t)
 '(shm-use-presentation-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold)))))
