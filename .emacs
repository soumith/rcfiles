(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 121 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


(setq c-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode t)
                (setq c-indent-level 4))))
(setq objc-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode t)
                (setq c-indent-level 4))))
(setq c++-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))


(setq column-number-mode t)

(setq transient-mark-mode t)

; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding.
(global-set-key "\C-m"        'newline-and-indent)

(global-set-key "\C-k" 'compile)


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

(add-to-list 'load-path "~/.emacs.d/bash-completion/")
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
    "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
	  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
	  'bash-completion-dynamic-complete)


;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-c-mode-hook ()
  (setq c-basic-offset 2
	c-label-offset 0
	indent-tabs-mode nil
	require-final-newline nil)
  (lambda () (auto-fill-mode 1))
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; code folding hooks
(add-hook 'c-mode-common-hook
	  (lambda()
	    (local-set-key (kbd "\C-c <right>") 'hs-show-block)
	    (local-set-key (kbd "\C-c <left>")  'hs-hide-block)
	    (local-set-key (kbd "\C-c <up>")    'hs-hide-all)
	    (local-set-key (kbd "\C-c <down>")  'hs-show-all)
	    (hs-minor-mode t)))

(add-to-list 'load-path "~/.emacs.d/")
(autoload 'markdown-mode "markdown-mode"
     "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
