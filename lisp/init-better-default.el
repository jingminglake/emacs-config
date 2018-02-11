;; hot refresh when init.el modified
(global-auto-revert-mode t)

(global-linum-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(recentf-mode t)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(global-hl-line-mode t)

(setq enable-recursive-minibuffers t)

(provide 'init-better-default)
