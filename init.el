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
    gitignore-mode))

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
