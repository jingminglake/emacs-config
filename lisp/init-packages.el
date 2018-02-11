;;add whatever packages I want here
(defvar yaxionh/packages '(
			   company
			   zenburn-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   exec-path-from-shell
			   popwin
			   
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

;; let emacs could find the execuable file in mac os
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-company-mode t)

(load-theme 'zenburn t)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
