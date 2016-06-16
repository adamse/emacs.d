;;; custom-variables.el ---

;; Copyright (c) 2016 Adam Sandberg Eriksson. All rights reserved.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    ((output-dvi "open")
     (output-pdf "Preview.app")
     (output-html "open"))))
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" ".")))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(browse-url-generic-args nil)
 '(calendar-week-start-day 1)
 '(company-ghc-show-info t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(ghc-location "~/src/ghc/strict/")
 '(ghc-source-location "~/src/ghc/strict/")
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
 '(haskell-process-type (quote auto))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-process-path
   "/Users/adam/.emacs.d/packages/hindent/.stack-work/install/x86_64-osx/nightly-2015-12-11/7.10.2/bin/hindent")
 '(hindent-style "johan-tibell")
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-file-extensions-order (quote (".lagda" ".tex")))
 '(ispell-dictionary "en_GB-ise")
 '(ispell-program-name "aspell")
 '(jonprl-path "/Users/adam/local/JonPRL/bin/jonprl")
 '(lpaste-author "adamse")
 '(org-agenda-files (quote ("~/Org/todo.org")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "open -a /Applications/Preview.app %s"))))
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
 '(org-latex-classes
   (quote
    (("letter" "\\documentclass[11pt,a4paper]{scrlttr2}"
      ("\\paragraph{%s}" . "\\paragraph*{%s}"))
     ("article" "\\documentclass[11pt,a4paper]{scrartcl}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-latex-default-class "article")
 '(org-latex-pdf-process
   (quote
    ("latexmk -pdf -interaction=nonstopmode -output-directory=%o %f")))
 '(org-startup-truncated nil)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(safe-local-variable-values
   (quote
    ((haskell-process-type quote ghci)
     (haskell-process-args-ghci "--interactive" "-package" "ghc")
     (haskell-process-path-ghci . "~/src/ghc/strict/inplace/bin/ghc-stage2")
     (ghc-dev-mode . t)
     (haskell-process-type . stack-ghci)
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
 '(shm-use-presentation-mode t)
 '(sml-electric-pipe-mode nil)
 '(sml-indent-args 2)
 '(sml-indent-level 2)
 '(sml-rightalign-and nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-variable-name-face))))
 '(shm-current-face ((t (:background "#eee8d5"))))
 '(shm-quarantine-face ((t (:background "Lemonchiffon1")))))
