;; Commentary
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq package-selected-packages
       '(tree-mode ivy helm tango-plus-theme espresso-theme projectile company package+ lsp-dart cl-format dockerfile-mode smart-mode-line-powerline-theme smart-mode-line spaceline airline-themes monokai-theme monokai-pro-theme web-mode lsp-ui require 'ruby-test-mode flycheck atomic-chrome))

(require 'airline-themes)
(require 'monokai-pro-theme)
(require 'helm)
(require 'helm)
(require 'ivy)

(package-initialize)
;;(package-install 'use-package)

;; TAGS tree
;;(add-to-list 'load-path "~/.emacs.d/vendor/")
;;(load "tags-tree.el")	     
;;(autoload 'tags-tree "tags-tree" "TAGS tree" t)
;;(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
;;(defun create-tags (dir-name)
;;   "Create tags file."
;;  (interactive "DDirectory: ")
 ;; (shell-command
;;     (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
;;    )

;;(require 'flycheck
;;  :ensure t
;;  :init (global-flycheck-mode))




(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(require 'atomic-chrome)
(atomic-chrome-start-server)

(require 'lsp-mode)

(setq lsp-solargraph-autoformat t
      lsp-solargraph-use-bundler nil
      )
(defun lsp-clients-ruby-make-options ()
  `(:solargraph.diagnostics t))

;; Ruby
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("solargraph" "stdio"))
                  :major-modes '(ruby-mode enh-ruby-mode)
                  :priority -1
                  :multi-root t
                  :initialization-options #'lsp-clients-ruby-make-options
                  :server-id 'ruby-ls))

(add-hook 'after-init-hook 'global-company-mode)

;; Projectile
(setq projectile-completion-system 'ivy)

;; Hide Evil and buffer state on inactive buffers.
;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-state-on-inactive-buffers t)

;; ;; "Hide eyebrowse indicator on inactive buffers.
;; ;; Valid Values: t (hidden), nil (shown)"
(setq airline-hide-eyebrowse-on-inactive-buffers t)

;; ;; Hide vc branch on inactive buffers:
;; ;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-vc-branch-on-inactive-buffers nil)

;; ;; Set eshell prompt colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-eshell-colors t)

;; ;; Set helm colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-helm-colors t)

;; ;; Set the cursor color based on the current evil state.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-cursor-colors t)

;; ;; Display the currend directory along with the filename.
;; ;; Valid Values: 'airline-directory-full
;; ;;               'airline-directory-shortened
;; ;;               nil (disabled)
(setq airline-display-directory nil)

;; ;; Max directory length to display when using 'airline-directory-shortened
;; (setq airline-shortened-directory-length 30)

;; ;; Unicode character choices
 (setq airline-utf-glyph-separator-left #xe0b0
       airline-utf-glyph-separator-right #xe0b2
       airline-utf-glyph-subseparator-left #xe0b1
       airline-utf-glyph-subseparator-right #xe0b3
       airline-utf-glyph-branch #xe0a0
       airline-utf-glyph-readonly #xe0a2
       airline-utf-glyph-linenumber #x2630)


(require 'monokai-pro-theme)
(load-theme 'airline-ayu_mirage t)
(load-theme 'tango t)

(use-package hemera-theme :ensure :defer)
(use-package nyx-theme :ensure :defer)
(use-package spacemacs-theme :ensure :defer)
(use-package circadian
  :ensure t
  :config
  (setq circadian-themes '(("8:00" . adwaita)
                           ("19:30" . monokai-pro)))
  (circadian-setup))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "White" :background "Orange" :box nil))))
 '(mode-line-inactive ((t (:foreground "White" :background "DarkGreen" :box nil)))))

(global-set-key (kbd "C-f") 'indent-region)
(global-set-key (kbd "C-g") 'goto-line)
