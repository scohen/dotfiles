(defun cofi/fortune2scratch ()
  "Return a comment-padded fortune cookie."
  (interactive)
  (let ((cookie (shell-command-to-string "fortune -a")))
    (concat
     (replace-regexp-in-string "^" ";; " cookie)
     "\n")))

(setq initial-scratch-message (cofi/fortune2scratch))

(defconst startup-time
  (current-time)
  "Time Emacs started.")

(mapc (lambda (dir)
             (add-to-list 'load-path dir))
      '(
        "~/.elisp"
        "~/.emacs.d"
        "~/.elisp/vendor/magit"
        "~/.elisp/vendor/sackspace"
        "~/.elisp/vendor/keychain-environment"
        "~/.elisp/vendor/gist"
        "/usr/local/share/emacs/site-lisp/semi/"
        "/usr/local/share/emacs/site-lisp/flim/"
        "/usr/local/share/emacs/site-lisp/apel/"
        "/usr/local/share/emacs/23.2/site-lisp/emu/"
        "/usr/local/share/emacs/site-lisp/wl/"
        ))

(defvar hostname (car (split-string system-name "\\." t)))

(require 'cofi-util)
(require 'cofi-vim)
(load "private" 'noerror)

(mapc #'load '(
            "cofi-autoloads"
            "cofi-buffer"
            "cofi-bbdb"
            "cofi-calendar"
            "cofi-color"
            "cofi-flymake"
            "cofi-haskell"
            "cofi-lisp"
            "cofi-mail"
            "cofi-markers"
            "cofi-project"
            "cofi-python"
            "cofi-snippets"
            "cofi-tex"
            "cofi-ui"
            "cofi-org"
            "cofi-windowing"
            "cofi-completion"
            ))

;; from http://edward.oconnor.cx/2010/08/standalone-gnus
(add-to-list 'command-switch-alist
             '("wl" . (lambda (&rest ignore)
                        ;; no line numbers with mail
                        (global-linum-mode -1)
                        ;; Start wanderlust when Emacs starts
                        (add-hook 'emacs-startup-hook 'wl t)
                        ;; Exit Emacs after quitting Gnus
                        (add-hook 'wl-exit-hook 'save-buffers-kill-emacs))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "xdg-open")
                                      (output-pdf "xdg-open")
                                      (output-dvi "xdg-open")
                                      (output-html "xdg-open")))))

(color-theme-cofi)

(message "Time needed to load: %d seconds."
         (time-to-seconds (time-since startup-time)))
