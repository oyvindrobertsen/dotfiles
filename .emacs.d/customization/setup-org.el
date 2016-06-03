(require 'org)
(require 'evil-org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq org-agenda-files '("~/org/"))

(setq org-default-notes-file "~/org/main.org")
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("c" "Calendar entry" entry (file+headline "" "Everything")
         "* %?\n  %T\n")))
