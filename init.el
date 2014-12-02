;; Standard libraries needed

(require 'cl)

;; Packages and configs to load

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
    dash
    elisp-slime-nav
    lpaste
    echo-keys
    align-by-current-symbol
    ag
;    w3m
    goto-last-point
    github-urls
    s
    hamlet-mode
    number
    hide-region
    ats-mode
    multiple-cursors
    projects-mode
;    resmacro
    flycheck)
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
    "haskell"
    "erc"
    "email"
    "lisp"
    "w3m"
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

(loop for name in packages
      do (progn (unless (fboundp name)
                  (add-to-list 'load-path
                               (concat (file-name-directory (or load-file-name
                                                                (buffer-file-name)))
                                       "packages/"
                                       (symbol-name name)))
                  (require name))))

(add-to-list 'custom-theme-load-path (concat (file-name-directory (or load-file-name (buffer-file-name))) "packages/color-theme-solarized"))

;; Setup path for OS X

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'shm)
(require 'hindent)
(require 'shm-case-split)
(require 'shm-reformat)
(require 'w3m-haddock)

;; Emacs configurations

(loop for name in configs
      do (load (concat (file-name-directory load-file-name)
                       "config/"
                       name ".el")))

;; Mode initializations

(smex-initialize)
(god-mode)
(load-theme 'solarized-light t)
(goto-last-point-mode)
(turn-on-haskell-simple-indent)
;(load "haskell-mode-autoloads.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" ".")))
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
 '(haskell-process-type (quote ghci))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-style "chris-done")
 '(safe-local-variable-values (quote ((haskell-indent-spaces . 4) (haskell-indent-spaces . 2) (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
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
 '(default ((t (:inherit nil :height 140 :width normal :family "Menlo"))))
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold)))))
