;;; private/oyvind/config.el -*- lexical-binding: t; -*-

;; Eager autocomplete
(setq doom-font (font-spec :family "Source Code Pro" :size 11))

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)
