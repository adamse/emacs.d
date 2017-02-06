;;; HOL.el --- Setup and configuration of HOL mode

;; Copyright (c) 2014 Adam Sandberg Eriksson. All rights reserved.

;;; Code:


(require 'eri)
(require 'sml-mode)

(load "~/src/cakeml/HOL/tools/hol-mode.el")

(defun hol-mark-line-tactic ()
  "Marks the tactic at current line"
  (interactive)
  (deactivate-mark)
  (move-beginning-of-line nil)
  (skip-chars-forward " \\\\>-")        ; skip chaining tacticts
  (if (and (looking-at "(")
           (= (line-number-at-pos)
              (save-excursion (forward-list)
                              (line-number-at-pos))))
      (progn
        (push-mark)
        (forward-list))
    (if (looking-at "(")
        (skip-chars-forward "("))
    (push-mark)
    (move-end-of-line nil))
  (setq mark-active t))

(defun hol-eval-line-tactic ()
  "Highlights and evaluates the current line as a tactic in the HOL buffer."
  (interactive)
  (hol-mark-line-tactic)
  (copy-region-as-hol-tactic (region-beginning) (region-end) nil))

(define-key sml-mode-map (kbd "TAB") 'eri-indent)
(define-key sml-mode-map (kbd "S-TAB") 'eri-indent-reverse)

(define-key hol-map "\M-e" 'hol-eval-line-tactic)

(add-hook
 'sml-mode-hook
 (lambda ()
   (kill-local-variable 'electric-indent-chars)
   (kill-local-variable 'electric-layout-rules)
   (setq electric-indent-inhibit t)))

(provide 'HOL)
