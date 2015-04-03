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
(global-linum-mode t)
(require 'linum-relative)

;; don't babysit me
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; frame-oriented
(setq default-frame-alist
      '((font . "Source Code Pro 14") (scroll-bar-mode . -1)))
(setq initial-frame-alist default-frame-alist)
      ;; '((font . "Source Code Pro 14")))
(setq pop-up-frames t)
(global-set-key (kbd "C-x 3") 'new-frame)

;; evil!
(require 'evil)
(setq evil-default-state 'normal)
(setq evil-default-cursor t)
(evil-mode 1)
(setq-default truncate-lines 1)

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

;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Python mode
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
(add-hook 'python-mode-hook (function (lambda () (setq python-indent-offset 4))))
(add-hook 'python-mode-hook (function (lambda () (setq evil-shift-width python-indent-offset))))

;; emacs ipython notebook
(require 'ein)

;; css mode
(add-hook 'css-mode-hook 'rainbow-mode)

;; Javascript mode
(setq js-indent-level 2)
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

;; haskell-mode
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; C mode
(setq c-default-style "linux"
      c-basic-offset 2)
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

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; ido-mode
(require 'ido)
(ido-mode t)

;; Long-line highlighting
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
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
(add-hook 'after-init-hook (lambda () (load-theme 'solarized-light)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'zenburn)))

;; Nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(flycheck-display-errors-function (quote flycheck-display-error-messages))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(whitespace-line-column 99))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "gainsboro"))) t))
