;; javascript / html
;; Setup web-mode
(require 'web-mode)
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[s]css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-basic-offset 2)
(add-hook 'js2-jsx-mode-hook (lambda () (tern-mode t)))

(defun web-mode-customization ()
  "Hooks for Web mode."
  (setq web-mode-code-indent-offset 2)
)

(add-hook 'web-mode-hook  'web-mode-customization)
