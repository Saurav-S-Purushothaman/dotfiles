;;; operate-on-number-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from operate-on-number.el

(autoload 'find-number-at-point "operate-on-number" "\
Search the current line till EOL for a number.
If a pure number is found, move point to the end of the number
and return the value.  Raise an error otherwise." t)
(autoload 'apply-operation-to-number-at-point "operate-on-number" "\
Apply an operation specified by KEY on a number at point.

If called interactively, use the last key input as KEY.

If the operation requires an additional operand, it is taken from
one of the following sources in the order named:

1. Prefix argument if given

2. Value read from keyboard if READ-ARGS is non-nil or the :read
   property is non-nil

3. Default argument predefined in `operate-on-number-at-point-alist'

(fn &optional KEY READ-ARGS)" t)
(autoload 'operate-on-number-at-point "operate-on-number" "\
Operate on number at point.

The kind of operation to perform is specified by the following
key typed.

An optional number ARG becomes a counter operand to the number at
point for the operation if applicable.

(fn &optional ARG)" t)
(register-definition-prefixes "operate-on-number" '("apply-to-number-at-point" "oon--" "operate-on-number-"))

;;; End of scraped data

(provide 'operate-on-number-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; operate-on-number-autoloads.el ends here
