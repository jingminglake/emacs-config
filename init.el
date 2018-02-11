
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

(require 'cl) ;;  common lisp package

;;add whatever packages I want here
(defvar yaxionh/packages '(
			   company
			   zenburn-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   exec-path-from-shell
			   
			   ) "Defalut packages")
(setq package-selected-packages yaxionh/packages)

(defun yaxionh/packages-installed-p ()
  (loop for pkg in yaxionh/packages
	when (not (package-installed-p pkg)) do (return nil)
		  finally (return t)))

  (unless (yaxionh/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg yaxionh/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))
			     
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(smartparens-global-mode t)


;; let emacs could find the execuable file in mac os
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; hot refresh when init.el modified
(global-auto-revert-mode t)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; My configurations
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(electric-indent-mode -1)
(global-linum-mode t)
(setq-default cursor-type 'bar)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f1>") 'open-my-init-file)
(global-company-mode t)


(recentf-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(load-theme 'zenburn t)
