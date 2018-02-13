(setq doom-font (font-spec :family "Source Code Pro" :size 11))

;; Eager autocomplete
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(defvar last-post-command-position 0 "Position in buffer after previous command.")
(make-variable-buffer-local 'last-post-command-position)
(defun show-json-path-on-position-change-hook ()
  "Print JSON path to message buffer if position changed."
  (unless (equal (point) last-post-command-position)
    (jsons-print-path))
  (setq last-post-command-position (point)))

(add-hook 'json-mode-hook
          (lambda () (add-hook 'post-command-hook #'show-json-path-on-position-change-hook nil 'local)))

(def-package! evil-magit :after magit
  :init
  (setq evil-magit-state 'normal))
