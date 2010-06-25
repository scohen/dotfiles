(defun cofi-do-mail ()
  (interactive)
  (set-buffer-modified-p nil)
  (setq make-backup-files nil)
  (mail-mode)
  (turn-on-auto-fill)
  (setq fill-column 72)
  (ac-flyspell-mode)
  (mail-text))

;; serve sup
(push '("\.compose-mode$" . cofi-do-mail) auto-mode-alist)
(push '("\.reply-mode$" . cofi-do-mail) auto-mode-alist)

(provide 'cofi-mail)