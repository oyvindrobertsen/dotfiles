;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))


(require 'use-package)

(setq use-package-always-ensure t)

(use-package paredit)
(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package cider)
(use-package ido-ubiquitous)
(use-package smex)
(use-package projectile)
(use-package rainbow-delimiters)
(use-package tagedit)
(use-package magit)
(use-package evil)
(use-package evil-leader)
(use-package evil-magit)
(use-package evil-org)
;;(use-package evil-mu4e)
(use-package php-mode)
(use-package scss-mode)
(use-package markdown-mode)
(use-package company)
(use-package company-jedi)
(use-package company-tern)
(use-package js2-mode)
(use-package web-mode)
(use-package fireplace)
(use-package org-bullets)
(use-package flycheck)
(use-package editorconfig)
(use-package exec-path-from-shell)
(use-package spaceline)
(use-package diminish)
;;(use-package mu4e-alert)
(use-package gruvbox-theme)
(use-package ag)

(add-to-list 'exec-path "/usr/local/bin")

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customization")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-php.el")
(load "setup-org.el")

;; Email

;;(load "email.el")

(use-package ensime :pin melpa-stable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
 '(fci-rule-color "#343d46")
 '(ns-alternate-modifier (quote none))
 '(ns-function-modifier (quote meta))
 '(ns-right-alternate-modifier (quote none))
 '(package-selected-packages
   (quote
    (ag web-mode tagedit spaceline smex scss-mode rainbow-delimiters projectile php-mode paredit org-bullets mu4e-alert markdown-mode js2-mode ido-ubiquitous gruvbox-theme flycheck fireplace exec-path-from-shell evil-org evil-mu4e evil-magit ensime editorconfig diminish company-tern company-jedi clojure-mode-extra-font-locking cider)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
