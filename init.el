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

(use-package god-mode
  :ensure t)

(use-package elisp-slime-nav
  :ensure t)

(use-package goto-last-change
  :ensure t)

(use-package exec-path-from-shell
  :ensure t)

(use-package gist
  :ensure t)

;; Packages in .emacs.d

(defvar packages
  '(lpaste
    ghc-dev-mode)
  "Packages whose location follows the
  packages/package-name/package-name.el format.")

(defvar custom-load-paths
  '("hindent/elisp")
  "Custom load paths that don't follow the normal
  package-name/module-name.el format.")

(defvar configs
  '("agda"
    "HOL"
    "global"
    "god"
    "haskell"
    "lisp"
    "magit"
    "osx"
    "writing")
  "Configuration files that follow the config/foo.el file path
  format.")

;; Load packages

(loop
 for location in custom-load-paths do
 (add-to-list
  'load-path
  (concat
   (file-name-directory
    (or load-file-name
        (buffer-file-name)))
   "packages/"
   location)))

(loop
 for name in packages do
 (progn
   (unless (fboundp name)
     (add-to-list
      'load-path
      (concat
       (file-name-directory (or load-file-name (buffer-file-name)))
       "packages/"
       (symbol-name name)))
     (require name))))

;; Emacs configurations

(loop for name in configs
      do (load (concat (file-name-directory load-file-name)
                       "config/"
                       name ".el")))

;; Start server

(server-start)

;; Custom space

(setq custom-file "~/.emacs.d/custom-variables.el")
(load custom-file)
