;;; idle-highlight-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from idle-highlight-mode.el

(autoload 'idle-highlight-mode "idle-highlight-mode" "\
Idle-Highlight Minor Mode.

This is a minor mode.  If called interactively, toggle the
`Idle-Highlight mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `idle-highlight-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(put 'idle-highlight-global-mode 'globalized-minor-mode t)
(defvar idle-highlight-global-mode nil "\
Non-nil if Idle-Highlight-Global mode is enabled.
See the `idle-highlight-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `idle-highlight-global-mode'.")
(custom-autoload 'idle-highlight-global-mode "idle-highlight-mode" nil)
(autoload 'idle-highlight-global-mode "idle-highlight-mode" "\
Toggle Idle-Highlight mode in all buffers.
With prefix ARG, enable Idle-Highlight-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Idle-Highlight mode is enabled in all buffers where
`idle-highlight--turn-on' would do it.

See `idle-highlight-mode' for more information on Idle-Highlight
mode.

(fn &optional ARG)" t)
(register-definition-prefixes "idle-highlight-mode" '("idle-highlight-"))

;;; End of scraped data

(provide 'idle-highlight-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; idle-highlight-mode-autoloads.el ends here
