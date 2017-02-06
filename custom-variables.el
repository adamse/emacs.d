;;; custom-variables.el ---

;; Copyright (c) 2016 Adam Sandberg Eriksson. All rights reserved.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list nil)
 '(TeX-view-program-selection
   (quote
    ((output-dvi "open")
     (output-pdf "displayline")
     (output-html "open"))))
 '(agda2-include-dirs (quote ("/Users/adam/local/agda-stdlib/src" ".")))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(browse-url-generic-args nil)
 '(calendar-week-start-day 1)
 '(company-ghc-show-info t)
 '(compilation-message-face (quote default))
 '(confirm-kill-emacs (quote y-or-n-p))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#eee8d5")
 '(ghc-location "~/src/ghc/strict/")
 '(ghc-source-location "~/src/ghc/ghc/")
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
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hindent-process-path
   "/Users/adam/.emacs.d/packages/hindent/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/bin/hindent")
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-file-extensions-order (quote (".lagda" ".tex")))
 '(ido-ignore-files
   (quote
    ("\\.dyn_hi$" "\\.dyn_o$" "\\.hi$" "\\.o$" "\\.tags$" "^\\.ghci$" "\\.agdai$" "\\.ibc$")))
 '(ispell-dictionary "en_GB-ise")
 '(ispell-program-name "aspell")
 '(jonprl-path "/Users/adam/local/JonPRL/bin/jonprl")
 '(lpaste-author "adamse")
 '(magit-diff-use-overlays nil)
 '(mouse-wheel-progressive-speed nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
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
 '(package-selected-packages
   (quote
    (ediprolog racket-mode haskell-mode writegood-mode w3m use-package unicode-fonts solarized-theme sml-mode smex reveal-in-osx-finder paredit org-trello org multiple-cursors matlab-mode markdown-mode magit idris-mode goto-last-change god-mode gitignore-mode gitconfig-mode gist flycheck exec-path-from-shell erlang emmet-mode elisp-slime-nav company-ghc company-coq auctex ag ace-jump-mode)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(prolog-system (quote swi))
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
 '(scroll-step 1)
 '(send-mail-function (quote smtpmail-send-it))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-hdevtools nil)
 '(shm-use-presentation-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml-electric-pipe-mode nil)
 '(sml-indent-args 2)
 '(sml-indent-level 2)
 '(sml-rightalign-and nil)
 '(standard-indent 2)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(unicode-fonts-fallback-font-list (quote ("Apple Color Emoji" "Symbola" "Quivira")))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-variable-name-face))))
 '(shm-current-face ((t (:background "#eee8d5"))))
 '(shm-quarantine-face ((t (:background "Lemonchiffon1")))))
