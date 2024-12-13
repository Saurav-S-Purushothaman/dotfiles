;;; init.el --- Prelude's configuration entry point.
;;
;; Copyright (c) 2011-2023 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.1.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules defined within Emacs Prelude.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
                                        ;(package-initialize)

(defvar prelude-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "[Prelude] Prelude is powering up... Be patient, Master %s!" prelude-user)

(when (version< emacs-version "25.1")
  (error "[Prelude] Prelude requires GNU Emacs 25.1 or newer, but you're running %s" emacs-version))

;; Always load newest byte code
;; (setq display-line-numbers 'relative)



;; write config here

;; I search
(setq search-wrap-around t)
(setq load-prefer-newer t)

;; Org mode auto header
(setq org-autolist-mode t)


;; Clojure ;;
;; Clj refactor
(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; (require 'rainbow-delimiters)
;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; Clojure lsp
(setq package-selected-packages '(clojure-mode lsp-mode cider lsp-treemacs flycheck company))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-semantic-tokens-mode 1
      ;; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ;; Use cider auto complete
      lsp-enable-completion-at-point nil)

;; Global lsp semantic token mode
(defvar global-lsp-semantic-token-mode nil
  "Global status of LSP semantic token mode.")

(defun global-toggle-lsp-semantic-token-mode ()
  "Toggle lsp-semantic-token-mode for all buffers with LSP mode enabled.
Also ensures it's enabled automatically for new buffers with LSP mode."
  (interactive)
  (setq global-lsp-semantic-token-mode (not global-lsp-semantic-token-mode))

  ;; Function to enable/disable semantic tokens in a buffer
  (defun apply-semantic-token-mode ()
    (when (bound-and-true-p lsp-mode)
      (if global-lsp-semantic-token-mode
          (lsp-semantic-tokens-mode 1)
        (lsp-semantic-tokens-mode -1))))

  ;; Apply to all existing buffers
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (apply-semantic-token-mode)))

  ;; Add hook for future buffers
  (if global-lsp-semantic-token-mode
      (add-hook 'lsp-mode-hook #'lsp-semantic-tokens-mode)
    (remove-hook 'lsp-mode-hook #'lsp-semantic-tokens-mode))

  (message "Global LSP semantic token mode %s"
           (if global-lsp-semantic-token-mode "enabled" "disabled")))

;; Clojure ends here ;;

(setq enable-recursive-minibuffers t)
(setq blink-cursor-blinks 0)
;; font
(set-frame-font "Iosevka Fixed-18")

;; Remove scroll bar
(scroll-bar-mode 0)


;; Disable MacOs's native fullscreen behavior
(setq ns-use-native-fullscreen nil)
(setq frame-resize-pixelwise t)


(setq sp-highlight-pair-overlay nil)
(setq global-hl-line-mode -1)
(setq-default line-spacing 1)
(setq-default fill-column 72)
(setq-default auto-fill-mode t)
(setq-default menu-bar--display-line-number-mode-relative)
(blink-cursor-mode 1)


;; Copy line down
(defun duplicate-line-down ()
  "Duplicate the current line and move the cursor to the new line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank))

(global-set-key (kbd "C-S-d") 'duplicate-line-down)

;; Note: Ctrl + Shift + up or down to copy line down of up
;; Move text line down

;; Enable global whitespace mode
(setq global-whitespace-mode 1)


;; Creating a new line from the current line below the current line just
;; like how vim does it for "o"
(defun open-line-below ()
  "Open a new line below the current line and enter insert mode."
  (interactive)
  (end-of-line)  ; Move to the end of the line
  (newline-and-indent))  ; Create a new line and indent

(global-set-key (kbd "C-j") 'open-line-below)

;; Creating a new line from the current line above the current line
;; Just like how vim does it for O
(defun open-line-above ()
  "Open a new line above the current line and enter insert mode."
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent))

(global-set-key (kbd "C-S-j") 'open-line-above)

;; Comment a line
(global-set-key (kbd "C-;") 'comment-line)

;; Change fill column indicator color
;; Color of global fill column indicator line
(defun fill-column-color-default ()
  (interactive)
  (custom-set-faces
   '(fill-column-indicator
     (()))))

(defun fill-column-color-dark ()
  (interactive)
  (custom-set-faces
   '(fill-column-indicator
     ((t (:foreground "grey30"))))))

(defun fill-column-color-light()
  (interactive)
  (custom-set-faces
   '(fill-column-indicator
     ((t (:foreground "grey80"))))))

(defun xah-toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height.
URL `http://xahlee.info/emacs/emacs/emacs_toggle_line_spacing.html'
Version 2017-06-02"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing 0.4))
  (redraw-frame (selected-frame)))

;; (xah-toggle-line-spacing)

;; Multiple Cursor
(require 'multiple-cursors)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-S-.")       'mc/skip-to-next-like-this)
(global-set-key (kbd "C-S-,")       'mc/skip-to-previous-like-this)


;; display fill indicator
(global-display-fill-column-indicator-mode t)
(set-fill-column 72)

(blink-cursor-mode 1)
(menu-bar--display-line-numbers-mode-none)

;; Smooth scrolliqng
(setq smooth-scrolling-mode 1)

;; set width to 80 column length if multiple window is open
(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))


(defun set-window-body-width (columns)
  "Set the selected window's body width to COLUMNS, excluding the menu bar and other UI elements."
  (let* ((window (selected-window))
         (frame (selected-frame))
         (body-width (window-body-width window))
         (char-width (frame-char-width))
         (line-height (frame-char-height))
         (menu-bar-height (if (menu-bar-mode) (frame-parameter nil 'menu-bar-lines) 0))
         (line-number-width (if (bound-and-true-p display-line-numbers-mode)
                                (line-number-display-width) 0))
         (desired-width (* columns char-width))
         (current-width (frame-pixel-width))
         (total-width (+ desired-width line-number-width (* menu-bar-height line-height))))
    ;; Set the frame width to accommodate the desired body width
    (set-frame-width frame (/ total-width char-width))
    (set-frame-height frame (frame-height frame))))

(defun set-80-columns ()
  "Set the selected window's body width to 80 columns."
  (interactive)
  (set-window-width 80))

;; Use this if 'menu-bar--display-line-number-mode is not none
(defun set-85-columns ()
  "Set the selected window's body width to 85 columsn"
  (interactive)
  (set-window-width 86))

(global-set-key (kbd "C-x ~") 'set-80-columns)
;; Width set to 80

(setq set-fill-column 72)
(setq auto-fill-mode t)

;; Remove scroll bars
(setq scroll-bar-mode 0)


;; Use adaptive wrap to wrap code comment at 72 character
(adaptive-wrap-prefix-mode t)
(use-package adaptive-wrap
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'adaptive-wrap-prefix-mode))





;; Define Prelude's directory structure
(defvar prelude-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Prelude distribution.")
(defvar prelude-core-dir (expand-file-name "core" prelude-dir)
  "The home of Prelude's core functionality.")
(defvar prelude-modules-dir (expand-file-name  "modules" prelude-dir)
  "This directory houses all of the built-in Prelude modules.")
(defvar prelude-personal-dir (expand-file-name "personal" prelude-dir)
  "This directory is for your personal configuration.

Users of Emacs Prelude are encouraged to keep their personal configuration
changes in this directory.  All Emacs Lisp files there are loaded automatically
by Prelude.")
(defvar prelude-personal-preload-dir (expand-file-name "preload" prelude-personal-dir)
  "This directory is for your personal configuration, that you want loaded before Prelude.")
(defvar prelude-vendor-dir (expand-file-name "vendor" prelude-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")
(defvar prelude-savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This folder stores all the automatically generated save/history-files.")
(defvar prelude-modules-file (expand-file-name "prelude-modules.el" prelude-personal-dir)
  "This file contains a list of modules that will be loaded by Prelude.")

(unless (file-exists-p prelude-savefile-dir)
  (make-directory prelude-savefile-dir))

(defun prelude-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (string-prefix-p "." f)))
        (add-to-list 'load-path name)
        (prelude-add-subfolders-to-load-path name)))))

;; add Prelude's directories to Emacs's `load-path'
(add-to-list 'load-path prelude-core-dir)
(add-to-list 'load-path prelude-modules-dir)
(add-to-list 'load-path prelude-vendor-dir)
(prelude-add-subfolders-to-load-path prelude-vendor-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; preload the personal settings from `prelude-personal-preload-dir'
(when (file-exists-p prelude-personal-preload-dir)
  (message "[Prelude] Loading personal configuration files in %s..." prelude-personal-preload-dir)
  (mapc 'load (directory-files prelude-personal-preload-dir 't "^[^#\.].*el$")))

(message "[Prelude] Loading Prelude's core modules...")

;; load the core stuff
(require 'prelude-packages)
(require 'prelude-custom)  ;; Needs to be loaded before core, editor and ui
(require 'prelude-ui)
(require 'prelude-core)
(require 'prelude-mode)
(require 'prelude-editor)
(require 'prelude-global-keybindings)

;; macOS specific settings
(when (eq system-type 'darwin)
  (require 'prelude-macos))

;; Linux specific settings
(when (eq system-type 'gnu/linux)
  (require 'prelude-linux))

;; WSL specific setting
(when (and (eq system-type 'gnu/linux) (getenv "WSLENV"))
  (require 'prelude-wsl))

;; Windows specific settings
(when (eq system-type 'windows-nt)
  (require 'prelude-windows))

(message "[Prelude] Loading Prelude's additional modules...")

;; the modules
(if (file-exists-p prelude-modules-file)
    (load prelude-modules-file)
  (message "[Prelude] Missing personal modules file %s" prelude-modules-file)
  (message "[Prelude] Falling back to the bundled example file sample/prelude-modules.el")
  (message "[Prelude] You should copy this file to your personal configuration folder and tweak it to your liking")
  (load (expand-file-name "sample/prelude-modules.el" prelude-dir)))

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" prelude-personal-dir))

;; load the personal settings (this includes `custom-file')
(when (file-exists-p prelude-personal-dir)
  (message "[Prelude] Loading personal configuration files in %s..." prelude-personal-dir)
  (mapc 'load (delete
               prelude-modules-file
               (directory-files prelude-personal-dir 't "^[^#\.].*\\.el$"))))

(message "[Prelude] Prelude is ready to do thy bidding, Master %s!" prelude-user)

;; Patch security vulnerability in Emacs versions older than 25.3
(when (version< emacs-version "25.3")
  (with-eval-after-load "enriched"
    (defun enriched-decode-display-prop (start end &optional param)
      (list start end))))

(prelude-eval-after-init
 ;; greet the use with some useful tip
 (run-at-time 5 nil 'prelude-tip-of-the-day))

;;; init.el ends here
