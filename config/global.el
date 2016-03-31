;; Requirements

(require 'uniquify)
(require 'org-agenda)
;; (require 'ielm)
;; (require 'expand-region)
(require 'flyspell)
(require 'unicode-fonts)

;; Fundamental functions

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun select-current-line ()
  "Select the current line."
  (interactive)
  (execute-kbd-macro [?\C-e S-home]))

(defun set-auto-saves ()
  "Put autosave files (ie #foo#) in one place, *not*
 scattered all over the file system!"
  (defvar autosave-dir
    (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

  (make-directory autosave-dir t)

  (defun auto-save-file-name-p (filename)
    (string-match "^#.*#$" (file-name-nondirectory filename)))

  (defun make-auto-save-file-name ()
    (concat autosave-dir
            (if buffer-file-name
                (concat "#" (file-name-nondirectory buffer-file-name) "#")
              (expand-file-name
               (concat "#%" (buffer-name) "#")))))

  (defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
  (setq backup-directory-alist (list (cons "." backup-dir))))

(defun auto-chmod ()
  "If we're in a script buffer, then chmod +x that script."
  (and (save-excursion
         (save-restriction
           (widen)
           (goto-char (point-min))
           (save-match-data
             (looking-at "^#!"))))
       (shell-command (concat "chmod u+x " buffer-file-name))
       (message (concat "Saved as script: " buffer-file-name))))

(defun find-alternate-file-with-sudo ()
  "Re-open with sudo."
  (interactive)
  (let ((point (point)))
    (find-alternate-file (concat "/sudo::" (buffer-file-name)))
    (goto-char point)))

(defun comment-dwim-line (&optional arg)
  "Do-what-I-mean commenting the current line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(defun reorder-buffer-list (pre-sort-list)
  "Re-order the buffer list."
  (let* ((sort-list (remove-if-not #'buffer-live-p pre-sort-list))
         (sort-len (length sort-list)))
    (mapc #'bury-buffer sort-list)
    (let* ((buffers (buffer-list))
           (buffers-len (length buffers)))
      (loop repeat (- buffers-len sort-len)
            for buf in buffers
            do (bury-buffer buf)))))

(defun save-window-config ()
  "Saves the current window configuration."
  (interactive)
  (message "Entering recursive window configuration ...")
  (let ((buffers (buffer-list)))
    (save-window-excursion
      (recursive-edit)
      (message "Restored window configuration."))
    (reorder-buffer-list buffers)))

(defun echo-mode ()
  "Start grepping /tmp/echo."
  (interactive)
  (grep "tail -f /tmp/echo -n 0"))

(defmacro bol-with-prefix (function)
  "Define a new function which calls FUNCTION.
Except it moves to beginning of line before calling FUNCTION when
called with a prefix argument. The FUNCTION still receives the
prefix argument."
  (let ((name (intern (format "endless/%s-BOL" function))))
    `(progn
       (defun ,name (p)
         ,(format
           "Call `%s', but move to BOL when called with a prefix argument."
           function)
         (interactive "P")
         (let ((col (current-column)))
           (when p
             (forward-line 0))
           (call-interactively ',function)
           (when p
             (forward-char col))))
       ',name)))

;; Global keybindings

(global-set-key [remap org-kill-line] (bol-with-prefix org-kill-line))
(global-set-key [remap kill-line] (bol-with-prefix kill-line))

(global-set-key (kbd "s-s") 'save-window-config)
(global-set-key (kbd "s-g") 'exit-recursive-edit)
(global-set-key (kbd "s-u") 'winner-mode-undo)

(global-set-key (kbd "M-z") 'zap-up-to-char-repeatable)
(global-set-key (kbd "M-Q") 'unfill-paragraph)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-x") 'goto-last-change)
(global-set-key (kbd "C-x C-TAB") 'indent-rigidly)
(global-set-key (kbd "C-t") 'replace-regexp)
(global-set-key (kbd "C-z") 'ido-switch-buffer)
(global-set-key (kbd "C-,") 'ace-jump-char-mode)

(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "<left>") 'windmove-left)
(global-set-key (kbd "<right>") 'windmove-right)
(global-set-key (kbd "<up>") 'windmove-up)
(global-set-key (kbd "<down>") 'windmove-down)

(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; Convenience bindings for god-mode

(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C-!") 'eval-defun)

;; Disable default settings

(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq kmacro-execute-before-append nil)

(set-default 'tags-case-fold-search nil)

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Enable cool modes

(ido-mode 1)
(global-font-lock-mode 1)

;; (require 'dired-x)
;; (setq-default dired-omit-files-p t)
;; (setq dired-omit-files "\\.dyn_hi$\\|\\.dyn_o$\\|\\.hi$\\|\\.o$|\\.ibc$")

(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)
(set-auto-saves)

;; Default mode settings

(setq default-major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq ido-ignore-files
      '("\\.dyn_hi$"
        "\\.dyn_o$"
        "\\.hi$"
        "\\.o$"
        "\\.tags$"
        "^\\.ghci$"
        "\\.agdai$"))
(setq ido-max-directory-size 200000)

(setq org-log-done t
      org-todo-keywords '((sequence "BLOCKED" "TODO" "DONE")
                          (sequence "PASS")
                          (sequence "DEFERRED"))
      org-priority-faces (quote ((49 . zenburn-red)
                                 (50 . zenburn-yellow)
                                 (51 . zenburn-green))))

(setq org-use-fast-todo-selection t)

;; Global settings

(setq tab-width 2)
(setq scroll-step 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq require-final-newline t)

;; Hooks

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'auto-chmod)
(add-hook 'shell-mode-hook 'set-ansi-colors)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
(add-hook 'ielm-mode-hook 'elisp-slime-nav-mode)


;; Auto-loads

;; (add-to-list 'auto-mode-alist (cons "\\.hs\\'" 'haskell-mode))
;; (add-to-list 'auto-mode-alist (cons "\\.cabal\\'" 'haskell-cabal-mode))
;; (add-to-list 'auto-mode-alist '("\\.hcr\\'" . haskell-core-mode))

(add-to-list 'auto-mode-alist (cons "\\.el\\'" 'emacs-lisp-mode))

(add-to-list 'auto-mode-alist (cons "\\.md\\'" 'markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.markdown\\'" 'markdown-mode))

;; Environment settings

(set-language-environment "UTF-8")

;; Faces

(set-default-font "-apple-PragmataPro-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
(set-fontset-font "fontset-default" 'unicode "PragmataPro")
;(set-fontset-font "fontset-default" 'unicode "Symbola")

(defface esk-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "#bbbbbb")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

(defface dark-paren-face
  '((((class color) (background dark))
     (:foreground "#ffffff"))
    (((class color) (background light))
     (:foreground "#000000")))
  "Face used to darken parentheses."
  :group 'starter-kit-faces)

;; Change lambda to an actual lambda symbol
(mapc (lambda (major-mode)
        (font-lock-add-keywords
         major-mode
         '(("(\\|)\\|\\[\\|\\]" . 'esk-paren-face))))
      '(emacs-lisp-mode haskell-mode))

;; Fix emoji
(setq unicode-fonts-block-font-mapping
      '(("Emoticons"
	 ("Apple Color Emoji" "Symbola" "Quivira")))
      unicode-fonts-fontset-names '("fontset-default"))
(unicode-fonts-setup)

;; Uniquify

(setq uniquify-buffer-name-style (quote post-forward-angle-brackets))

(provide 'global)
