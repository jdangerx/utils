
;; Adding package repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)) ; doesn't actually add .emacs.d, only subdirs

;; general purpose shortcuts
(global-set-key (kbd "C-x r") 'revert-buffer)

;; get rid of stuff that's not important
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(show-paren-mode t)
(tool-bar-mode -1)

;; add numbers to tell me where I am
(column-number-mode t)
;; (global-linum-mode t)
;; (require 'linum-relative)

;; don't babysit me
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(scroll-bar-mode -1)

;; frame-oriented
(setq default-frame-alist
      '((font . "Source Code Pro 10") (vertical-scroll-bars . nil)))
(setq initial-frame-alist default-frame-alist)
;; '((font . "Source Code Pro 14")))
(setq pop-up-frames t)
(global-set-key (kbd "C-x 2") 'make-frame)
(global-set-key (kbd "C-x 3") 'make-frame)

;; evil!
(require 'evil)
(setq evil-default-state 'normal)
(setq evil-default-cursor t)
(evil-mode 1)
(setq-default truncate-lines 1)

;;; evil kj quit 
(require 'key-chord)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)

;;; quits that make sense
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'keyboard-quit)

;; evil-matchit
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; evil-surround
(require 'surround)
(global-surround-mode 1)

;;; better comments
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-logical-line)))
(global-set-key "\M-;" 'comment-or-uncomment-region-or-line)


;; unique buffer name
(require 'uniquify)

;; Setup Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; auto-indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; tramp
(require 'tramp)

;; Flycheck
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'php-mode-hook 'flycheck-mode)

;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(setq org-src-fontify-natively t)
(setq org-log-done t)

;; 6502 assembly
(require '6502-mode)
;; (add-to-list 'auto-mode-alist '("\\.asm" . 6502-mode))

;; Python mode
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
(add-hook 'python-mode-hook (function (lambda () (setq python-indent-offset 4))))
(add-hook 'python-mode-hook (function (lambda () (setq evil-shift-width python-indent-offset))))

;; emacs ipython notebook
(require 'ein)

;; css mode
(add-hook 'css-mode-hook 'rainbow-mode)

;; Javascript mode
(setq js-indent-level 4)
(add-hook 'js-mode-hook
	  (function (lambda ()
		      (setq evil-shift-width js-indent-level))))
(add-hook 'js-mode-hook 'rainbow-mode)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
	  (function (lambda ()
		      (setq evil-shift-width 2))))

;; racket-mode
(require 'racket-mode)

;; haskell-mode
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; C mode
(setq c-default-style "linux")
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook
	  (function (lambda () (setq evil-shift-width c-basic-offset))))

;; LaTeX mode
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (add-to-list 'fill-nobreak-predicate 'texmathp)))

;; deft-mode
(require 'deft)
(setq deft-use-filename-as-title t)
(evil-set-initial-state 'deft-mode 'emacs)
(global-set-key [f5] 'deft)
(setq deft-directory "/home/john/Dropbox/deft/")
(setq deft-extension "md")
(setq deft-text-mode (quote markdown-mode))

;; php-mode
(autoload 'geben "geben" "DBGp protocol frontend, a script debugger")
(require 'php-mode)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; ido-mode
(require 'ido)
(ido-mode t)

;; Long-line highlighting
(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)

;; trim whitespace
(require 'ws-trim)
(global-set-key (kbd "C-x t") 'ws-trim-buffer)
(set-default 'ws-trim-level 2)
(setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))

;; prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Cosmetics
;; themes
(add-hook 'after-init-hook (lambda () (load-theme 'solarized-dark)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'zenburn)))

;; pretty symbols??
;; (global-prettify-symbols-mode 1)

;; (setq haskell-symbols '(
;; ("->" ?→) ("=>" ?⇒) ("<-" ?← )
;; (">=" ?≥) ("<=" . ?≤) ("/=" ?≠)))

;; (add-hook 'haskell-mode-hook (lambda ()
;; (setq prettify-symbols-alist haskell-symbols)))


;; Nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(flycheck-disabled-checkers (quote (phpmd)))
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(flycheck-php-phpcs-executable "phpcs")
 '(frame-background-mode nil)
 '(haskell-indentation-show-indentations nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-program-name "ghci")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "gainsboro"))) t))
