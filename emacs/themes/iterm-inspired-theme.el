;;; iterm-inspired-theme.el --- An Emacs theme inspired by your iTerm2 colors -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Your Name
;; URL: https://example.org
;; Version: 0.1
;; Package-Requires: ((emacs "24"))
;; Keywords: faces

;;; Commentary:
;; This theme is generated from the iTerm2 color scheme you provided.
;; Place this file in your Emacs load path, then run:
;;
;;   M-x load-theme RET iterm-inspired RET
;;
;; If you’d like to enable it on startup, add something like:
;;
;;   (load-theme 'iterm-inspired t)
;;
;; to your Emacs configuration.

;;; Code:

(deftheme iterm-inspired
  "An Emacs theme inspired by the provided iTerm2 colors.")

;; Convert 0.0-1.0 floats to 00-FF hex components:
(defun iterm-inspired-theme--to-hex (r g b)
  (format "#%02X%02X%02X"
          (round (* 255 r))
          (round (* 255 g))
          (round (* 255 b))))

;;------------------------------------------------------------------
;; Here are the raw RGB float values from your iTerm2 file
;; (Background Color, Foreground Color, etc.), converted to hex.
;;------------------------------------------------------------------

(let* (
       ;; Background Color
       (bg (iterm-inspired-theme--to-hex 0.14612796532846714
                                        0.13737454379562045
                                        0.30919251824817445))
       ;; Foreground Color
       (fg (iterm-inspired-theme--to-hex 0.86274510622024536
                                        0.86274510622024536
                                        0.80000001192092896))
       ;; Cursor Color
       (cursor-col (iterm-inspired-theme--to-hex 1.0
                                                0.3333333432674408
                                                0.3333333432674408))
       ;; Bold Color
       (bold-col   (iterm-inspired-theme--to-hex 1.0
                                                0.36862745098039218
                                                0.49019607843137253))
       ;; Selection (region) Color
       (region-col (iterm-inspired-theme--to-hex 0.70980393886566162
                                                0.83529412746429443
                                                1.0))
       ;; Selected Text Color
       (region-fg  (iterm-inspired-theme--to-hex 0.0
                                                0.0
                                                0.0))

       ;; Ansi 0..15
       (ansi-0  (iterm-inspired-theme--to-hex 0.14509803921568626
                                             0.13725490196078433
                                             0.30980392156862746))
       (ansi-1  (iterm-inspired-theme--to-hex 0.43921568989753723
                                             0.31372550129890442
                                             0.31372550129890442))
       (ansi-2  (iterm-inspired-theme--to-hex 0.37647059559822083
                                             0.70588237047195435
                                             0.54117649793624878))
       (ansi-3  (iterm-inspired-theme--to-hex 0.87450981140136719
                                             0.68627452850341797
                                             0.56078433990478516))
       (ansi-4  (iterm-inspired-theme--to-hex 0.33333333333333331
                                             0.33333333333333331
                                             1.0))
       (ansi-5  (iterm-inspired-theme--to-hex 0.94117647409439087
                                             0.54901963472366333
                                             0.76470589637756348))
       (ansi-6  (iterm-inspired-theme--to-hex 0.54901963472366333
                                             0.81568628549575806
                                             0.82745099067687988))
       (ansi-7  (iterm-inspired-theme--to-hex 0.43921568989753723
                                             0.56470590829849243
                                             0.50196081399917603))
       (ansi-8  (iterm-inspired-theme--to-hex 0.43921568989753723
                                             0.56470590829849243
                                             0.50196081399917603))
       (ansi-9  (iterm-inspired-theme--to-hex 0.86274510622024536
                                             0.63921570777893066
                                             0.63921570777893066))
       (ansi-10 (iterm-inspired-theme--to-hex 0.37647059559822083
                                             0.70588237047195435
                                             0.54117649793624878))
       (ansi-11 (iterm-inspired-theme--to-hex 0.94117647409439087
                                             0.87450981140136719
                                             0.68627452850341797))
       (ansi-12 (iterm-inspired-theme--to-hex 0.33333333333333331
                                             0.33333333333333331
                                             1.0))
       (ansi-13 (iterm-inspired-theme--to-hex 0.92549020051956177
                                             0.57647061347961426
                                             0.82745099067687988))
       (ansi-14 (iterm-inspired-theme--to-hex 0.57647061347961426
                                             0.87843137979507446
                                             0.89019608497619629))
       (ansi-15 (iterm-inspired-theme--to-hex 1.0
                                             1.0
                                             1.0))
       ;; Emacs face spec requires something like ((class color) (min-colors 89))
       (class '((class color) (min-colors 89))))

  (custom-theme-set-faces
   'iterm-inspired

   ;; Basic coloring
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor  ((,class (:background ,cursor-col))))
   `(region  ((,class (:background ,region-col :foreground ,region-fg))))
   `(highlight ((,class (:background ,region-col :foreground ,region-fg))))
   ;; Make sure “selected text color” is used for region

   ;; Font lock (syntax highlighting) faces — minimal example
   `(font-lock-builtin-face       ((,class (:foreground ,ansi-4))))
   `(font-lock-comment-face       ((,class (:foreground ,ansi-7))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,ansi-7))))
   `(font-lock-constant-face      ((,class (:foreground ,ansi-6))))
   `(font-lock-function-name-face ((,class (:foreground ,ansi-2))))
   `(font-lock-keyword-face       ((,class (:foreground ,ansi-5))))
   `(font-lock-string-face        ((,class (:foreground ,ansi-3))))
   `(font-lock-type-face          ((,class (:foreground ,ansi-14))))
   `(font-lock-variable-name-face ((,class (:foreground ,ansi-10))))
   `(font-lock-warning-face       ((,class (:foreground ,ansi-1 :weight bold))))

   ;; Emacs interface
   `(link                   ((,class (:foreground ,ansi-12 :underline t))))
   `(link-visited           ((,class (:foreground ,ansi-13 :underline t))))
   `(mode-line              ((,class (:background ,ansi-0 :foreground ,fg :box (:line-width 1 :style released-button)))))
   `(mode-line-inactive     ((,class (:background ,ansi-8 :foreground ,fg :box (:line-width 1 :style released-button)))))
   `(fringe                 ((,class (:background ,bg))))
   `(minibuffer-prompt      ((,class (:foreground ,ansi-4 :weight bold))))

   ;; Show-paren
   `(show-paren-match       ((,class (:background ,ansi-14 :foreground ,bg :weight bold))))
   `(show-paren-mismatch    ((,class (:background ,ansi-1  :foreground ,ansi-15 :weight bold))))

   ;; Success/Error
   `(success ((,class (:foreground ,ansi-2 :weight bold))))
   `(error   ((,class (:foreground ,ansi-1 :weight bold))))
   )

  ;; Set the ANSI color vector so shells respect this theme
  (custom-theme-set-variables
   'iterm-inspired
   `(ansi-color-names-vector
     [,ansi-0 ,ansi-1 ,ansi-2 ,ansi-3 ,ansi-4 ,ansi-5 ,ansi-6 ,ansi-7])))

;;;###autoload
(when load-file-name
  ;; Register theme (for Emacs < 24 compatibility)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'iterm-inspired)

;;; iterm-inspired-theme.el ends here
