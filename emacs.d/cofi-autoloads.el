(autoload 'ack "full-ack" "Run ack." t)
(autoload 'ack-same "full-ack" "Run ack in files matching the current major mode." t)

(autoload 'adict-change-dictionary "auto-dictionary"
  "Set buffer language to LANG and stop detecting it automatically." t)
(autoload 'adict-guess-dictionary "auto-dictionary"
  "Automatically change ispell dictionary based on buffer language." t)
(autoload 'auto-dictionary-mode "auto-dictionary"
  "A minor mode that automatically sets `ispell-dictionary`." t)

(autoload 'boxquote-defun "boxquote" "Boxquote the current defun" t)
(autoload 'boxquote-insert-buffer "boxquote" "Insert & boxquote a buffer" t)
(autoload 'boxquote-insert-file "boxquote" "Insert & boxquote a file" t)
(autoload 'boxquote-paragraph "boxquote" "Boxquote the current paragraph" t)
(autoload 'boxquote-region "boxquote" "Boxquote the current region" t)
(autoload 'boxquote-shell-command "boxquote"
  "Insert & boxquote output of shell command" t)
(autoload 'boxquote-unbox "boxquote" "Remove boxquote that surrounds point" t)

(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

(autoload 'dedicated-mode "dedicated" "Dedicate currect buffer." t)

(autoload 'dired-jump "dired" "Jump to current buffer's file in dired" t)

(autoload 'home-end-end "home-end" "Go to end of line/window/buffer." t)
(autoload 'home-end-home "home-end" "Go to beginning of line/window/buffer." t)

(autoload 'idomenu "idomenu" "Switch to a buffer-local tag from Imenu via Ido." t)

(autoload 'magit-status "magit" nil t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'markdown-mode "markdown-mode" "Mode for markdown files" t)

(autoload 'try-pysmell-complete "pysmell" "PySmell-Hippie-Completer" t)

(autoload 'rainbow-mode "rainbow-mode" "Highlight color names in buffer" t)

(autoload 'smex "smex" "A better M-x" t)

(autoload 'speck-mode "speck" "Auto spellchecking mode." t)
(autoload 'speck-buffer "speck" "Toggle `speck-mode' for current buffer." t)

(autoload 'trivial-cite "tc"
  "A simple citation function for use in news/mailreaders." t)

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-user-agent-compose "wl-draft" "Compose mail with Wanderlust" t)

(autoload 'gist-region-or-buffer "gist" "Post either the current region, or if
mark is not set, the current buffer as a new paste." t)
(autoload 'gist-region-or-buffer-private "gist" "Post either the current region,
or if mark is not set, the current buffer as a new private paste." t)
(autoload 'gist-list "gist" "Displays a list of all of the current user's
gists." t)
(autoload 'gist-fetch "gist" "Fetches a Gist and inserts it into a new buffer"
  t)

(provide 'cofi-autoloads)
