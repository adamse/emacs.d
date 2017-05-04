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
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(browse-url-generic-args nil)
 '(calendar-week-start-day 1)
 '(company-ghc-show-info t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
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
 '(hindent-process-path
   "/Users/adam/.emacs.d/packages/hindent/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/bin/hindent")
 '(hindent-reformat-buffer-on-save nil)
 '(hindent-style "johan-tibell")
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
 '(mouse-wheel-progressive-speed nil)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "open -a /Applications/Preview.app %s"))))
 '(package-selected-packages
   (quote
    (auctex ediprolog racket-mode haskell-mode writegood-mode w3m use-package unicode-fonts solarized-theme sml-mode smex reveal-in-osx-finder paredit org multiple-cursors matlab-mode markdown-mode magit idris-mode goto-last-change god-mode gitignore-mode gitconfig-mode gist flycheck exec-path-from-shell erlang emmet-mode elisp-slime-nav company-ghc company-coq ag ace-jump-mode)))
 '(prolog-system (quote swi))
 '(safe-local-variable-values
   (quote
    ((TeX-master . master_background\.tex)
     (TeX-master . master_background)
     (haskell-process-type quote ghci)
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
 '(sml-electric-pipe-mode nil)
 '(sml-indent-args 2)
 '(sml-indent-level 2)
 '(sml-rightalign-and nil)
 '(standard-indent 2)
 '(unicode-fonts-fallback-font-list (quote ("Apple Color Emoji" "Symbola" "Quivira"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-my-nick-face ((t (:foreground "#dca3a3" :weight bold))))
 '(haskell-literate-comment-face ((t (:inherit font-lock-variable-name-face))))
 '(shm-current-face ((t (:background "#eee8d5"))))
 '(shm-quarantine-face ((t (:background "Lemonchiffon1")))))
