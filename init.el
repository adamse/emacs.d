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
    ghc ; for ghc-mod
    company
    company-ghc
    company-coq
    git-commit-mode
    git-rebase-mode
    magit
    gitconfig-mode
    gitignore-mode
    matlab-mode
    org))

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
    ;magit
    goto-last-change
    ace-jump-mode
;    w3m
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
    idris-mode
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
  '("osx"
    "global"
    "god"
    "agda"
    "coq"
    "haskell"
    "erc"
;    "w3m"
    "email"
    "lisp"
    "markdown"
    "python"
    "tex"
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

;; Setup  for OS X


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
 '(hindent-process-path "/Users/adam/.emacs.d/packages/hindent/.cabal-sandbox/bin/hindent")
 '(hindent-style "chris-done")
 '(org-html-head "<style type=\"text/css\">.figure {text-align:center;
         width: 50%;
         margin-left:auto;
         margin-right:auto;
         background-color: #ececec;
         padding: 0.3em;
        }
.caption {font-size:90%;
      }

body {
    margin: auto;
    padding-right: 1em;
    padding-left: 1em;
    max-width: 44em;
    /* border-left: 1px solid black;
    border-right: 1px solid black; */
    color: black;
    font-family: sans-serif;
    /* font-size: 100%;
    line-height: 140%; */
    /* background-color: #ececec; */
}
pre {
/*     border: 1px dotted gray; */
    background-color: #ececec;
    color: #1111111;
    padding: 0.5em;
}
code {
    font-family: monospace;
    padding: 0.1em;

/*    font-style: italic; */
/*    font-weight: bold;  */
}
h1 a, h2 a, h3 a, h4 a, h5 a {
    text-decoration: none;
    /* color: #7a5ada; */
}
h1, h2, h3, h4, h5 {
    /* font-family: verdana; */
    font-weight: bold;
/*    border-bottom: 1px dotted black; */
    /* color: #7a5ada; */
}
h1 {
        font-size: 130%;
}

h2 {
        font-size: 110%;
}

h3 {
        font-size: 95%;
}

h4 {
        font-size: 90%;
        font-style: italic;
}

h5 {
        font-size: 90%;
        font-style: italic;
}

h1.title {
        font-size: 200%;
        font-weight: bold;
        padding-top: 0.2em;
        padding-bottom: 0.2em;
        text-align: left;
        border: none;
}

dt code {
        font-weight: bold;
}
dd p {
        margin-top: 0;
}

#footer {
        padding-top: 1em;
        font-size: 70%;
        color: gray;
        text-align: center;
}

#toc {
/*  list-style-type: none;
    float: left;
    max-width: 10em;
    font-size: 80%;
    margin: 0;

/*
  position: absolute;
  top: 1em;
  left: 1em;
  border: thin dotted

  /*

  padding: 0;
  margin: 0; */
/*

  width: 9em  */
}

#toc li {
  /* background: white; */
  /* margin: 0.5em 0; */
  /* padding: 0.3em; */
  /* border-right: 1em solid black */
}
#toc a {
  text-decoration: none }

/* a:link { color: blue } */
/* a:visited { color: purple } */

address {
  margin-top: 1em;
  padding-top: 1em;
  border-top: thin dotted
}

img {
margin-left: auto;
margin-right: auto;
max-width: 100%;
}</style>")
 '(org-startup-truncated nil)
 '(safe-local-variable-values (quote ((coq-prog-args "-emacs-U" "-I" "/Users/adam/Code/cpdt/cpdt/src") (haskell-indent-spaces . 4) (haskell-indent-spaces . 2) (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
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
