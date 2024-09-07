;;; gruber-dark-theme.el --- Gruber Darker color theme for Emacs 24.

;; Copyright (C) 2013-2016 Alexey Kutepov a.k.a rexim
;; Copyright (C) 2009-2010 Jason R. Blevins

;; Author: Alexey Kutepov <reximkut@gmail.com>
;; URL: http://github.com/rexim/gruber-dark-theme
;; Version: 0.7

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;;
;; Gruber Darker color theme for Emacs by Jason Blevins. A darker
;; variant of the Gruber Dark theme for BBEdit by John Gruber. Adapted
;; for deftheme and extended by Alexey Kutepov a.k.a. rexim.


(deftheme gruber-dark
  "Gruber Darker color theme for Emacs 24")

;; Please, install rainbow-mode.
;; Colors with +x are lighter. Colors with -x are darker.
(let ((gruber-dark-fg        "#e4e4ef")
      (gruber-dark-fg+1      "#f4f4ff")
      (gruber-dark-fg+2      "#f5f5f5")
      (gruber-dark-white     "#ffffff")
      (gruber-dark-black     "#000000")
      (gruber-dark-bg-1      "#101010")
      (gruber-dark-bg        "#181818")
      (gruber-dark-bg+1      "#282828")
      (gruber-dark-bg+2      "#453d41")
      (gruber-dark-bg+3      "#484848")
      (gruber-dark-bg+4      "#52494e")
      (gruber-dark-red-1     "#c73c3f")
      (gruber-dark-red       "#f43841")
      (gruber-dark-red+1     "#ff4f58")
      (gruber-dark-green     "#73c936")
      (gruber-dark-yellow    "#ffdd33")
      (gruber-dark-brown     "#cc8c3c")
      (gruber-dark-quartz    "#95a99f")
      (gruber-dark-niagara-2 "#303540")
      (gruber-dark-niagara-1 "#565f73")
      (gruber-dark-niagara   "#96a6c8")
      (gruber-dark-wisteria  "#9e95c7")
      )
  (custom-theme-set-variables
   'gruber-dark
   '(frame-brackground-mode (quote dark)))

  (custom-theme-set-faces
   'gruber-dark

   ;; Agda2
   `(agda2-highlight-datatype-face ((t (:foreground ,gruber-dark-quartz))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,gruber-dark-quartz))))
   `(agda2-highlight-function-face ((t (:foreground ,gruber-dark-niagara))))
   `(agda2-highlight-keyword-face ((t ,(list :foreground gruber-dark-yellow
                                             :bold t))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,gruber-dark-green))))
   `(agda2-highlight-number-face ((t (:foreground ,gruber-dark-wisteria))))

   ;; AUCTeX
   `(font-latex-bold-face ((t (:foreground ,gruber-dark-quartz :bold t))))
   `(font-latex-italic-face ((t (:foreground ,gruber-dark-quartz :italic t))))
   `(font-latex-math-face ((t (:foreground ,gruber-dark-green))))
   `(font-latex-sectioning-5-face ((t ,(list :foreground gruber-dark-niagara
                                             :bold t))))
   `(font-latex-slide-title-face ((t (:foreground ,gruber-dark-niagara))))
   `(font-latex-string-face ((t (:foreground ,gruber-dark-green))))
   `(font-latex-warning-face ((t (:foreground ,gruber-dark-red))))

   ;; Basic Coloring (or Uncategorized)
   `(border ((t ,(list :background gruber-dark-bg-1
                       :foreground gruber-dark-bg+2))))
   `(cursor ((t (:background ,gruber-dark-yellow))))
   `(default ((t ,(list :foreground gruber-dark-fg
                        :background gruber-dark-bg))))
   `(fringe ((t ,(list :background nil
                       :foreground gruber-dark-bg+2))))
   `(vertical-border ((t ,(list :foreground gruber-dark-bg+2))))
   `(link ((t (:foreground ,gruber-dark-niagara :underline t))))
   `(link-visited ((t (:foreground ,gruber-dark-wisteria :underline t))))
   `(match ((t (:background ,gruber-dark-bg+4))))
   `(shadow ((t (:foreground ,gruber-dark-bg+4))))
   `(minibuffer-prompt ((t (:foreground ,gruber-dark-niagara))))
   `(region ((t (:background ,gruber-dark-bg+3 :foreground nil))))
   `(secondary-selection ((t ,(list :background gruber-dark-bg+3
                                    :foreground nil))))
   `(trailing-whitespace ((t ,(list :foreground gruber-dark-black
                                    :background gruber-dark-red))))
   `(tooltip ((t ,(list :background gruber-dark-bg+4
                        :foreground gruber-dark-white))))

   ;; Calendar
   `(holiday-face ((t (:foreground ,gruber-dark-red))))

   ;; Compilation
   `(compilation-info ((t ,(list :foreground gruber-dark-green
                                 :inherit 'unspecified))))
   `(compilation-warning ((t ,(list :foreground gruber-dark-brown
                                    :bold t
                                    :inherit 'unspecified))))
   `(compilation-error ((t (:foreground ,gruber-dark-red+1))))
   `(compilation-mode-line-fail ((t ,(list :foreground gruber-dark-red
                                           :weight 'bold
                                           :inherit 'unspecified))))
   `(compilation-mode-line-exit ((t ,(list :foreground gruber-dark-green
                                           :weight 'bold
                                           :inherit 'unspecified))))

   ;; Completion
   `(completions-annotations ((t (:inherit 'shadow))))

   ;; Custom
   `(custom-state ((t (:foreground ,gruber-dark-green))))

   ;; Diff
   `(diff-removed ((t ,(list :foreground gruber-dark-red+1
                             :background nil))))
   `(diff-added ((t ,(list :foreground gruber-dark-green
                           :background nil))))

   ;; Dired
   `(dired-directory ((t (:foreground ,gruber-dark-niagara :weight bold))))
   `(dired-ignored ((t ,(list :foreground gruber-dark-quartz
                              :inherit 'unspecified))))

   ;; Ebrowse
   `(ebrowse-root-class ((t (:foreground ,gruber-dark-niagara :weight bold))))
   `(ebrowse-progress ((t (:background ,gruber-dark-niagara))))

   ;; Egg
   `(egg-branch ((t (:foreground ,gruber-dark-yellow))))
   `(egg-branch-mono ((t (:foreground ,gruber-dark-yellow))))
   `(egg-diff-add ((t (:foreground ,gruber-dark-green))))
   `(egg-diff-del ((t (:foreground ,gruber-dark-red))))
   `(egg-diff-file-header ((t (:foreground ,gruber-dark-wisteria))))
   `(egg-help-header-1 ((t (:foreground ,gruber-dark-yellow))))
   `(egg-help-header-2 ((t (:foreground ,gruber-dark-niagara))))
   `(egg-log-HEAD-name ((t (:box (:color ,gruber-dark-fg)))))
   `(egg-reflog-mono ((t (:foreground ,gruber-dark-niagara-1))))
   `(egg-section-title ((t (:foreground ,gruber-dark-yellow))))
   `(egg-text-base ((t (:foreground ,gruber-dark-fg))))
   `(egg-term ((t (:foreground ,gruber-dark-yellow))))

   ;; ERC
   `(erc-notice-face ((t (:foreground ,gruber-dark-wisteria))))
   `(erc-timestamp-face ((t (:foreground ,gruber-dark-green))))
   `(erc-input-face ((t (:foreground ,gruber-dark-red+1))))
   `(erc-my-nick-face ((t (:foreground ,gruber-dark-red+1))))

   ;; EShell
   `(eshell-ls-backup ((t (:foreground ,gruber-dark-quartz))))
   `(eshell-ls-directory ((t (:foreground ,gruber-dark-niagara))))
   `(eshell-ls-executable ((t (:foreground ,gruber-dark-green))))
   `(eshell-ls-symlink ((t (:foreground ,gruber-dark-yellow))))

   ;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,gruber-dark-yellow))))
   `(font-lock-comment-face ((t (:foreground ,gruber-dark-brown))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,gruber-dark-brown))))
   `(font-lock-constant-face ((t (:foreground ,gruber-dark-quartz))))
   `(font-lock-doc-face ((t (:foreground ,gruber-dark-green))))
   `(font-lock-doc-string-face ((t (:foreground ,gruber-dark-green))))
   `(font-lock-function-name-face ((t (:foreground ,gruber-dark-niagara))))
   `(font-lock-keyword-face ((t (:foreground ,gruber-dark-yellow :bold t))))
   `(font-lock-preprocessor-face ((t (:foreground ,gruber-dark-quartz))))
   `(font-lock-reference-face ((t (:foreground ,gruber-dark-quartz))))
   `(font-lock-string-face ((t (:foreground ,gruber-dark-green))))
   `(font-lock-type-face ((t (:foreground ,gruber-dark-quartz))))
   `(font-lock-variable-name-face ((t (:foreground ,gruber-dark-fg+1))))
   `(font-lock-warning-face ((t (:foreground ,gruber-dark-red))))

   ;; Flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,gruber-dark-red)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:foreground ,gruber-dark-red :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,gruber-dark-yellow)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,gruber-dark-yellow :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,gruber-dark-green)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,gruber-dark-green :weight bold :underline t))))

   ;; Flyspell
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,gruber-dark-red) :inherit unspecified))
      (t (:foreground ,gruber-dark-red :weight bold :underline t))))
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,gruber-dark-yellow) :inherit unspecified))
      (t (:foreground ,gruber-dark-yellow :weight bold :underline t))))

   ;; Helm
   `(helm-candidate-number ((t ,(list :background gruber-dark-bg+2
                                      :foreground gruber-dark-yellow
                                      :bold t))))
   `(helm-ff-directory ((t ,(list :foreground gruber-dark-niagara
                                  :background gruber-dark-bg
                                  :bold t))))
   `(helm-ff-executable ((t (:foreground ,gruber-dark-green))))
   `(helm-ff-file ((t (:foreground ,gruber-dark-fg :inherit unspecified))))
   `(helm-ff-invalid-symlink ((t ,(list :foreground gruber-dark-bg
                                        :background gruber-dark-red))))
   `(helm-ff-symlink ((t (:foreground ,gruber-dark-yellow :bold t))))
   `(helm-selection-line ((t (:background ,gruber-dark-bg+1))))
   `(helm-selection ((t (:background ,gruber-dark-bg+1 :underline nil))))
   `(helm-source-header ((t ,(list :foreground gruber-dark-yellow
                                   :background gruber-dark-bg
                                   :box (list :line-width -1
                                              :style 'released-button)))))

   ;; Ido
   `(ido-first-match ((t (:foreground ,gruber-dark-yellow :bold nil))))
   `(ido-only-match ((t (:foreground ,gruber-dark-brown :weight bold))))
   `(ido-subdir ((t (:foreground ,gruber-dark-niagara :weight bold))))

   ;; Info
   `(info-xref ((t (:foreground ,gruber-dark-niagara))))
   `(info-visited ((t (:foreground ,gruber-dark-wisteria))))

   ;; Jabber
   `(jabber-chat-prompt-foreign ((t ,(list :foreground gruber-dark-quartz
                                           :bold nil))))
   `(jabber-chat-prompt-local ((t (:foreground ,gruber-dark-yellow))))
   `(jabber-chat-prompt-system ((t (:foreground ,gruber-dark-green))))
   `(jabber-rare-time-face ((t (:foreground ,gruber-dark-green))))
   `(jabber-roster-user-online ((t (:foreground ,gruber-dark-green))))
   `(jabber-activity-face ((t (:foreground ,gruber-dark-red))))
   `(jabber-activity-personal-face ((t (:foreground ,gruber-dark-yellow :bold t))))

   ;; Line Highlighting
   `(highlight ((t (:background ,gruber-dark-bg+1 :foreground nil))))
   `(highlight-current-line-face ((t ,(list :background gruber-dark-bg+1
                                            :foreground nil))))

   ;; line numbers
   `(line-number ((t (:inherit default :foreground ,gruber-dark-bg+4))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,gruber-dark-yellow))))

   ;; Linum
   `(linum ((t `(list :foreground gruber-dark-quartz
                      :background gruber-dark-bg))))

   ;; Magit
   `(magit-branch ((t (:foreground ,gruber-dark-niagara))))
   `(magit-diff-hunk-header ((t (:background ,gruber-dark-bg+2))))
   `(magit-diff-file-header ((t (:background ,gruber-dark-bg+4))))
   `(magit-log-sha1 ((t (:foreground ,gruber-dark-red+1))))
   `(magit-log-author ((t (:foreground ,gruber-dark-brown))))
   `(magit-log-head-label-remote ((t ,(list :foreground gruber-dark-green
                                            :background gruber-dark-bg+1))))
   `(magit-log-head-label-local ((t ,(list :foreground gruber-dark-niagara
                                           :background gruber-dark-bg+1))))
   `(magit-log-head-label-tags ((t ,(list :foreground gruber-dark-yellow
                                          :background gruber-dark-bg+1))))
   `(magit-log-head-label-head ((t ,(list :foreground gruber-dark-fg
                                          :background gruber-dark-bg+1))))
   `(magit-item-highlight ((t (:background ,gruber-dark-bg+1))))
   `(magit-tag ((t ,(list :foreground gruber-dark-yellow
                          :background gruber-dark-bg))))
   `(magit-blame-heading ((t ,(list :background gruber-dark-bg+1
                                    :foreground gruber-dark-fg))))

   ;; Message
   `(message-header-name ((t (:foreground ,gruber-dark-green))))

   ;; Mode Line
   `(mode-line ((t ,(list :background gruber-dark-bg+1
                          :foreground gruber-dark-white))))
   `(mode-line-buffer-id ((t ,(list :background gruber-dark-bg+1
                                    :foreground gruber-dark-white))))
   `(mode-line-inactive ((t ,(list :background gruber-dark-bg+1
                                   :foreground gruber-dark-quartz))))

   ;; Neo Dir
   `(neo-dir-link-face ((t (:foreground ,gruber-dark-niagara))))

   ;; Org Mode
   `(org-agenda-structure ((t (:foreground ,gruber-dark-niagara))))
   `(org-column ((t (:background ,gruber-dark-bg-1))))
   `(org-column-title ((t (:background ,gruber-dark-bg-1 :underline t :weight bold))))
   `(org-done ((t (:foreground ,gruber-dark-green))))
   `(org-todo ((t (:foreground ,gruber-dark-red-1))))
   `(org-upcoming-deadline ((t (:foreground ,gruber-dark-yellow))))

   ;; Search
   `(isearch ((t ,(list :foreground gruber-dark-black
                        :background gruber-dark-fg+2))))
   `(isearch-fail ((t ,(list :foreground gruber-dark-black
                             :background gruber-dark-red))))
   `(isearch-lazy-highlight-face ((t ,(list
                                       :foreground gruber-dark-fg+1
                                       :background gruber-dark-niagara-1))))

   ;; Sh
   `(sh-quoted-exec ((t (:foreground ,gruber-dark-red+1))))

   ;; Show Paren
   `(show-paren-match-face ((t (:background ,gruber-dark-bg+4))))
   `(show-paren-mismatch-face ((t (:background ,gruber-dark-red-1))))

   ;; Slime
   `(slime-repl-inputed-output-face ((t (:foreground ,gruber-dark-red))))

   ;; Tuareg
   `(tuareg-font-lock-governing-face ((t (:foreground ,gruber-dark-yellow))))

   ;; Speedbar
   `(speedbar-directory-face ((t ,(list :foreground gruber-dark-niagara
                                        :weight 'bold))))
   `(speedbar-file-face ((t (:foreground ,gruber-dark-fg))))
   `(speedbar-highlight-face ((t (:background ,gruber-dark-bg+1))))
   `(speedbar-selected-face ((t (:foreground ,gruber-dark-red))))
   `(speedbar-tag-face ((t (:foreground ,gruber-dark-yellow))))

   ;; Which Function
   `(which-func ((t (:foreground ,gruber-dark-wisteria))))

   ;; Whitespace
   `(whitespace-space ((t ,(list :background gruber-dark-bg
                                 :foreground gruber-dark-bg+1))))
   `(whitespace-tab ((t ,(list :background gruber-dark-bg
                               :foreground gruber-dark-bg+1))))
   `(whitespace-hspace ((t ,(list :background gruber-dark-bg
                                  :foreground gruber-dark-bg+2))))
   `(whitespace-line ((t ,(list :background gruber-dark-bg+2
                                :foreground gruber-dark-red+1))))
   `(whitespace-newline ((t ,(list :background gruber-dark-bg
                                   :foreground gruber-dark-bg+2))))
   `(whitespace-trailing ((t ,(list :background gruber-dark-red
                                    :foreground gruber-dark-red))))
   `(whitespace-empty ((t ,(list :background gruber-dark-yellow
                                 :foreground gruber-dark-yellow))))
   `(whitespace-indentation ((t ,(list :background gruber-dark-yellow
                                       :foreground gruber-dark-red))))
   `(whitespace-space-after-tab ((t ,(list :background gruber-dark-yellow
                                           :foreground gruber-dark-yellow))))
   `(whitespace-space-before-tab ((t ,(list :background gruber-dark-brown
                                            :foreground gruber-dark-brown))))

   ;; tab-bar
   `(tab-bar ((t (:background ,gruber-dark-bg+1 :foreground ,gruber-dark-bg+4))))
   `(tab-bar-tab ((t (:background nil :foreground ,gruber-dark-yellow :weight bold))))
   `(tab-bar-tab-inactive ((t (:background nil))))

   ;; vterm / ansi-term
   `(term-color-black ((t (:foreground ,gruber-dark-bg+3 :background ,gruber-dark-bg+4))))
   `(term-color-red ((t (:foreground ,gruber-dark-red-1 :background ,gruber-dark-red-1))))
   `(term-color-green ((t (:foreground ,gruber-dark-green :background ,gruber-dark-green))))
   `(term-color-blue ((t (:foreground ,gruber-dark-niagara :background ,gruber-dark-niagara))))
   `(term-color-yellow ((t (:foreground ,gruber-dark-yellow :background ,gruber-dark-yellow))))
   `(term-color-magenta ((t (:foreground ,gruber-dark-wisteria :background ,gruber-dark-wisteria))))
   `(term-color-cyan ((t (:foreground ,gruber-dark-quartz :background ,gruber-dark-quartz))))
   `(term-color-white ((t (:foreground ,gruber-dark-fg :background ,gruber-dark-white))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,gruber-dark-fg :background ,gruber-dark-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,gruber-dark-brown :background ,gruber-dark-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,gruber-dark-brown :background ,gruber-dark-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,gruber-dark-fg :background ,gruber-dark-bg-1))))
   `(company-tooltip-mouse ((t (:background ,gruber-dark-bg-1))))
   `(company-tooltip-common ((t (:foreground ,gruber-dark-green))))
   `(company-tooltip-common-selection ((t (:foreground ,gruber-dark-green))))
   `(company-scrollbar-fg ((t (:background ,gruber-dark-bg-1))))
   `(company-scrollbar-bg ((t (:background ,gruber-dark-bg+2))))
   `(company-preview ((t (:background ,gruber-dark-green))))
   `(company-preview-common ((t (:foreground ,gruber-dark-green :background ,gruber-dark-bg-1))))

   ;; Proof General
   `(proof-locked-face ((t (:background ,gruber-dark-niagara-2))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,gruber-dark-yellow))))
   `(orderless-match-face-1 ((t (:foreground ,gruber-dark-green))))
   `(orderless-match-face-2 ((t (:foreground ,gruber-dark-brown))))
   `(orderless-match-face-3 ((t (:foreground ,gruber-dark-quartz))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'gruber-dark)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; gruber-dark-theme.el ends here.
