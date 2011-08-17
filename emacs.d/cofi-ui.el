;; Clean UI ========================================
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'tooltip-mode) (tooltip-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
;; ==================================================

;; other packages ========================================
(require-and-exec 'diminish
  (loop for (file mode lighter) in '(("yasnippet" 'yas/minor-mode " Y")
                                     ("autopair" 'autopair-mode " p")
                                     ("eldoc" 'eldoc-mode " elD")
                                     ("highlight-parentheses" 'highlight-parentheses-mode)
                                     ("undo-tree" 'undo-tree-mode)
                                     ("paredit" 'paredit-mode " pE"))
        do
        (eval-after-load file
             `(diminish ,mode ,lighter))))

(require-and-exec 'sml-modeline
                  (setq sml-modeline-len  8)
                  (sml-modeline-mode 1))

(setq hl-paren-colors '("#9C0F0F" "#BF0303" "#E20800" "#E85752" "#F08682" "#F9CCCA"))
(require-and-exec 'highlight-parentheses
                  (add-hook 'find-file-hook 'highlight-parentheses-mode))

(require-and-exec 'uniquify
                  (setq uniquify-buffer-name-style 'post-forward
                        uniquify-separator "/"
                        uniquify-after-kill-buffer-p t
                        uniquify-ignore-buffers-re "^\\*"))

(require-and-exec 'eldoc
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (eldoc-add-command 'autopair-insert-opening))

(setq doc-view-continuous t)

(require-and-exec 'keychain-environment
  (run-with-timer 100 (* 5 60) 'keychain/refresh))
;; ==================================================

;; Settings ========================================
(setq display-time-24hr-format t
      display-time-format "%H:%M %e.%m"
      display-time-mail-file 'none
      display-time-default-load-average nil)

(setq frame-title-format "emacs %b - <%f>"
      icon-title-format "emacs %b")

(setq global-mode-string '("" display-time-string
                           battery-mode-line-string
                           appt-mode-string))

(setq-default mode-line-format '("%e" mode-line-mule-info
                                 mode-line-client mode-line-modified
                                 mode-line-remote mode-line-frame-identification
                                 mode-line-buffer-identification
                                 mode-line-position
                                 (vc-mode vc-mode)
                                 (global-mode-string
                                  ("" global-mode-string
                                   #("--" 0 2 (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
                                 mode-line-modes
                                 (which-func-mode
                                  ("" which-func-format
                                   #("--" 0 2 (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
                                 viper-mode-string
                                 #("-%-" 0 3
                                   (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display")))
              )

(setq battery-mode-line-format " [%L %p%%]")

(mouse-avoidance-mode 'cat-and-mouse)

(setq comint-prompt-read-only t)

(setq comment-style 'align)

;;; Use string syntax for re-builder
(setq reb-re-syntax 'string)

(setq inhibit-startup-screen t)

(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; Use UTF-8 dammit
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq browse-url-browser-function '(("hyperspec" . w3m-browse-url)
                                    ("."         . browse-url-firefox)))
;; Spelling ====================
(setq speck-engine 'Hunspell
      speck-hunspell-library-directory "/usr/share/hunspell/")

(setq speck-hunspell-dictionary-alist '( ("de" . "de_DE")
                                         ("en" . "en_US")))
;; Let speck highlight doublets
(setq speck-doublet t)

(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra" "--run-together"))
;;; ========================================

;; tab settings
(setq-default tab-stop-list (range 4 160 4)
              indent-tabs-mode nil     ; no nasty tabs i say!
              tab-width 4)
(setq-default fill-column 80)
(setq tab-always-indent 'complete)

(setq dabbrev-case-replace nil)

;;; Help files
(setq-default woman-use-own-frame nil
              woman-use-topic-at-point t
              woman-imenu t
              woman-cache-filename (cofi/var-file "emacs/woman-cache"))

(eval-after-load "info"
  '(add-to-list 'Info-directory-list
         "~/doc/info"))
;;; ========================================

;; mixedCase to small_words_with_underscores (visually)
(setq glasses-separate-parentheses-p nil
      glasses-uncapitalize-p t
      glasses-uncapitalize-regexp "[a-zA-Z]")

(setq-default major-mode 'text-mode)
(setq-default cursor-type 'bar)

(setq compilation-scroll-output 'first-error)
(setq font-lock-verbose nil)
;; ==================================================

;; Default modes ========================================
(setq autopair-autowrap t)
(require-and-exec 'autopair
  (add-to-hooks (turn-on autopair-mode) '(text-mode-hook)))

(require-and-exec 'saveplace
                  (setq save-place-file (cofi/var-file "emacs/places"))
                  (setq-default save-place t))
(transient-mark-mode t)
(display-time-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)
(column-number-mode 1)
;; enable (and re-enable) linum-mode only on real files
(add-to-hooks (turn-on-file linum-mode)
              '(find-file-hook
                mumamo-after-change-major-mode-hook
                change-major-mode-hook))
(show-paren-mode t)
(when on-mobile?
  (ignore-errors
    (display-battery-mode 1)))

(defadvice save-buffers-kill-emacs (around no-process-query activate)
  (flet ((process-list ()))
    ad-do-it))
(setq mumamo-chunk-coloring 1)
;; ==================================================

;; enable functions ========================================
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'set-goal-column 'disabled nil)
(defalias 'yes-or-no-p 'y-or-n-p)
;; ==================================================

;; prettyfying ==============================
(add-to-list 'load-path "~/.elisp/vendor/pretty-mode/")
(require-and-exec 'pretty-mode
                  (global-pretty-mode 1))
;; ========================================
;;; scratch ====================
(defun save-a-scratch ()
  "Prevent *scratch* buffer from being killed.
Intended as `kill-buffer-query-functions' fun."
  (not (string= "*scratch*" (buffer-name))))

(push #'save-a-scratch kill-buffer-query-functions)
;;; ==============================
;;; input method ====================
(setq default-input-method 'german-postfix)
;;; C-x m i to toggle input-method, see cofi-keys.el
;;; ==============================

;;; use same colors in ansi-term as in term
(setq ansi-term-color-vector (vector 'unspecified
                                     (frame-parameter nil 'background-color)
                                     "#AE4747" "#556B2F"
                                     "#DAA520" "#7A7AB0"
                                     "#8B7B8B" "#A7A15E" "#DDDDDD"))
(setq multi-term-dedicated-select-after-open-p t)

(provide 'cofi-ui)
