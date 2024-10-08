;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================

;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; ===================================
;; Install Packages If Needed
;; ===================================

;; myPackages contains a list of package names
(defvar myPackages
  '(
    better-defaults                 ;; Set up some better Emacs defaults
    company
    anaconda-mode
    company-anaconda
    flycheck
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    material-theme                  ;; Theme
    lsp-mode
    lsp-ui
    lsp-treemacs
    treemacs
    ;; magit
    treemacs-projectile
    treemacs-icons-dired
    ;; treemacs-magit
    ein
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-display-line-numbers-mode t)               ;; Enable line numbers globally

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(better-defaults material-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-init-hook 'global-company-mode)


;; ===================================
;; Development Environment
;; ===================================

;; Anaconda mode
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; Blacken mode
(add-hook 'python-mode-hook 'blacken-mode)

;; Enable Flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;; LSP Server
(add-hook 'python-mode-hook 'lsp-deferred)

;; Company-Anaconda for better completion
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))

;; Enable autopep8
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ===================================
;; LSP and Treemacs Configuration
;; ===================================

;; LSP UI settings
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-doc-enable t
      lsp-ui-doc-use-childframe t
      lsp-ui-doc-position 'at-point
      lsp-ui-doc-include-signature t
      lsp-ui-sideline-enable t
      lsp-ui-sideline-ignore-duplicate t)

;; Use IPython for REPL
(setq python-shell-interpreter "ipython" ;; "jupyter"
      ;; python-shell-interpreter-args "notebook"
      python-shell-prompt-detect-failure-warning nil
      python-shell-completion-native-enable nil
      )
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;; 	     "ipython")

;; LSP Treemacs settings
(require 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)

;; Treemacs settings
(require 'treemacs)
(require 'treemacs-projectile)
(require 'treemacs-icons-dired)
;; (require 'treemacs-magit)
(treemacs-resize-icons 14)
(setq treemacs-show-cursor t)
