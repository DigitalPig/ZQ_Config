;; MELPA package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-backends
   (quote
    (company-lsp company-bbdb company-semantic company-clang company-cmake company-capf company-files
		      (company-dabbrev-code company-gtags company-etags company-keywords)
		      company-oddmuse company-dabbrev)))
 '(cua-mode nil nil (cua-base))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(flycheck-idle-change-delay 5)
 '(package-selected-packages
   (quote
    (company-box ms-python lsp-fortran company-lsp lsp-go lsp-mode lsp-python lsp-scala lsp-ui isortify treemacs treemacs-evil treemacs-icons-dired treemacs-magit treemacs-projectile use-package rainbow-delimiters evil-magit forge cython-mode flycheck-cython ein-mumamo poly-R poly-markdown poly-rst ein isend-mode pytest python-x counsel-gtags counsel-projectile counsel-tramp dockerfile-mode vagrant flycheck-pycheckers ivy-yasnippet stan-mode stan-snippets yasnippet-snippets json-mode yasnippet ess-R-data-view ess yaml-mode powerline-evil powerline blacken highlight-indent-guides ansible ansible-vault counsel counsel-dash docker ivy kubernetes kubernetes-evil magit markdown-mode markdown-mode+ terraform-mode exec-path-from-shell company-ansible company-auctex company-bibtex company-go flycheck-julia julia-mode julia-repl all-the-icons all-the-icons-dired company material-theme neotree projectile projectile-git-autofetch python-mode pyvenv evil evil-collection evil-ediff)))
 '(py-ipython-command-args "--pylab --automagic --simple-prompt")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Syntax check
(global-flycheck-mode)

;; Evil Mode VI mode for Emacs
(setq evil-want-keybinding nil)
(require 'evil)
  (evil-mode 1)
(evil-collection-init)
;; File Manager
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; Color Theme and other appearance
;; (load-theme 'seti t)
(display-battery-mode t)
;;(when (version<="26.0.50" emacs-version)
;;  (global-display-lin-number-mode))
;;(when (version> "26.0.50" emacs-version)
;;  (setq-default display-line-numbers 'relative))

(display-time-mode t)
(ido-mode t) 
(load-theme 'material t)
(setq inhibit-startup-screen t)
(show-paren-mode 1)
(when window-system (set-frame-size (selected-frame) 95 40))
(ivy-mode t)
(require 'powerline)
(powerline-default-theme)
(require 'isend-mode)
(counsel-mode t)
;; If you work with shell scripts
(add-hook 'isend-mode-hook 'isend-default-shell-setup)
;; If you work with python scripts, one of those could be used (but not both!)
;;   - default python interpreter
;;   - specific setup for iPython
(add-hook 'isend-mode-hook 'isend-default-ipython-setup)
;; If you work with julia
(add-hook 'isend-mode-hook 'isend-default-julia-setup)
(require 'rainbow-delimiters)

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") 'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python3") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ([f5]   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)


;; General Programming
(projectile-mode 1)
(setq projectile-project-search-path '("~/Codes"))
(add-hook 'after-init-hook 'global-company-mode)
;;(eval-after-load "company"
;; '(add-to-list 'company-backends '(company-anaconda :with company-capf)))




;; Python Mode
;;(add-hook 'python-mode-hook 'anaconda-mode)
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'pyvenv-mode)
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(require 'python-mode)
;;(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;; 	     (eldoc-mode 1)
;; 	     )
;; 	  )
; pyvenv environment setup
(setenv "WORKON_HOME" "/home/digitalpig/.conda/envs")
;; Fixes for python interpreter
;; (setq python-shell-interpreter "python3")
;;(setq python-shell-interpreter "ipython"
;;        python-shell-interpreter-args "--simple-prompt -i")
;; FlyCheck mode
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook 'flycheck-pycheckers-setup)
  )
;; Python mode key binding
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "<C-return>")
                        'py-execute-line)))
(add-to-list 'load-path (expand-file-name "/home/digitalpig/.emacs.d/lsp-ms/"))
(require 'ms-python)

(use-package lsp-mode
  :ensure t)
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-max-height 20
	    lsp-ui-doc-max-width 50
	    lsp-ui-sideline-ignore-duplicate t
	    lsp-ui-peek-always-show t))

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
	    company-idle-delay 0
	    company-tooltip-limit 10
	    company-transformers nil
	    company-show-numbers t
	    )
  (global-company-mode +1))

(use-package company-lsp
  :ensure t
  :commands (company-lsp)
  :config
  (setq company-lsp-async t
	)
  )

(use-package ms-python
  :config
  (add-hook 'python-mode-hook #'lsp)
  (setq ms-python-dotnet-install-dir "/home/digitalpig/Downloads/dotnet/"))
  

;; R Setup

;; Julia mode
(setq julia-repl-executable-records
      '((default "/usr/local/bin/julia")   ; in the executable path
        (master "~/src/julia-git/julia"))) ; compiled from the repository
(add-hook 'julia-mode-hook 'julia-repl-mode) ;; always use minor mode

;; Other fixes
(when (memq window-system '(mac ns x))
(exec-path-from-shell-initialize))
