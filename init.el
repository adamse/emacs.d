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
    company
    company-coq
    magit
    gitconfig-mode
    gitignore-mode
    matlab-mode
    solarized-theme
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
    goto-last-change
    ace-jump-mode
    markdown-mode
    pandoc-mode
    elisp-slime-nav
    lpaste
    echo-keys
    align-by-current-symbol
    s
    hide-region
    projects-mode
    smex
    ag
    goto-last-point
    github-urls
    hamlet-mode
    number
    multiple-cursors
    flycheck
    reveal-in-finder
    idris-mode
    expand-region
    jonprl-mode
    ;; who knows?
    )
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
    "w3m"
    "agda"
    "coq"
    "haskell"
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

;; Emacs configurations

(loop for name in configs
      do (load (concat (file-name-directory load-file-name)
                       "config/"
                       name ".el")))

;; Mode initializations

(god-mode)
(goto-last-point-mode)

;; Custom space

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" ".")))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(browse-url-generic-args nil)
 '(calendar-week-start-day 1)
 '(company-ghc-show-info t)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
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
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-process-path
   "/Users/adam/Code/emacs.d/packages/hindent/.stack-work/install/x86_64-osx/lts-2.9/7.8.4/bin/hindent")
 '(hindent-style "chris-done")
 '(ispell-dictionary "en_GB-ise")
 '(jonprl-path "/Users/adam/local/JonPRL/bin/jonprl")
 '(org-agenda-files (quote ("~/Org/todo.org")))
 '(org-html-head
   "<style type=\"text/css\">.figure {text-align:center;
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
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(safe-local-variable-values
   (quote
    ((haskell-process-type . stack-ghci)
     (haskell-process-args-ghci "ghci")
     (haskell-process-path-ghci . "stack")
     (haskell-process-type . ghci)
     (buffer-file-coding-system . utf-8-unix)
     (sgml-parent-document "users_guide.xml" "book" "chapter" "sect1")
     (sgml-parent-document "users_guide.xml" "book" "chapter")
     (coq-prog-args "-emacs-U" "-I" "/Users/adam/Code/cpdt/cpdt/src")
     (haskell-indent-spaces . 4)
     (haskell-indent-spaces . 2)
     (haskell-process-type . cabal-repl)
     (shm-lambda-indent-style . leftmost-parent))))
 '(send-mail-function (quote smtpmail-send-it))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-hdevtools nil)
 '(shm-use-presentation-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold))))
 '(shm-current-face ((t (:background "#eee8d5"))))
 '(shm-quarantine-face ((t (:background "Lemonchiffon1")))))
