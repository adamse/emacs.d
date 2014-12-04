;; Standard libraries needed

(require 'cl)
(require 'package)
(package-initialize)

;; Packages and configs to load

(defvar melpa-packages '(auctex))

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
    ats-mode
    multiple-cursors
    projects-mode
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

(add-to-list 'custom-theme-load-path
             (concat (file-name-directory (or load-file-name (buffer-file-name)))
                     "packages/color-theme-solarized"))

;; Install melpa packages

(defun melpa-packages-installed-p ()
  (loop for p in melpa-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (melpa-packages-installed-p)
  (package-refresh-contents)
  (dolist (p melpa-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Setup path for OS X

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
(load-theme 'solarized-light t)
(goto-last-point-mode)
(turn-on-haskell-simple-indent)
                                        ;(load "haskell-mode-autoloads.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ns-right-alternate-modifier (quote alt))
 '(safe-local-variable-values (quote ((haskell-indent-spaces . 2) (haskell-indent-spaces . 2) (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
 '(send-mail-function (quote smtpmail-send-it)))

(set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
