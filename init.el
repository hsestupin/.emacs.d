(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/")
             t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") 
             t)
(package-initialize)

;;----------------------------------------------------------------------
;; Install some must-have packages
;;----------------------------------------------------------------------
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages 
  '(
    ;; https://github.com/purcell/exec-path-from-shell
    exec-path-from-shell  
    
    ;; https://github.com/Wilfred/ag.el
    ;; frontend for awesome super fast search enging for silver searcher https://github.com/ggreer/the_silver_searcher
    ag
           
    ;; show available keybinding after you start typing
    which-key

    ;; load directory instead of loading every file
    load-dir    
   
    ;; Complete anything. http://company-mode.github.io/
    company
       
    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex
    
    ;; git integration
    magit

    ;; Yasnippet. Template system for Emacs. It allows you to type an abbreviation and automatically expand it into function templates
    yasnippet

    ;; Projectile. Helps you to manage project management. Basically was installed to find files inside a project and switching betweeb *.cpp/*.h files.
    projectile

    ;; Markdown highlighting
    markdown-mode

    ;; Super usefull and tiny emacs extentions. Thanks to @bbatsov - https://github.com/bbatsov/crux
    crux

    ;; ido mode everywhere
    ;ido-ubiquitous
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Vendors folder
(add-to-list 'load-path "~/.emacs.d/vendor")

;; fuzzy matching https://github.com/lewang/flx
(when (not (package-installed-p 'flx-ido))
    (package-install 'flx-ido))

;; display ido completions vertically
(when (not (package-installed-p 'ido-vertical-mode))
    (package-install 'ido-vertical-mode))

;(require 'ido)
;(require 'ido-ubiquitous)
(require 'flx-ido)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
;(ido-ubiquitous-mode +1)
(ido-vertical-mode 1)
;;(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;;; smex, remember recently and most frequently used commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Hard-to-categorize customizations
(load "misc.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; Default lisp mode customizations
(load "lisp-mode-setup.el")

;; Company mode customizations
(load "company-setup.el")

(load "magit-setup.el")
(load "crux-bindings.el")
(load "projectile-setup.el")

(load "ggtags-setup.el")
(load "ag-setup.el")

;; Load some Mac OS specific configurations. Redefine Meta-key, etc
(if (string-equal system-type "darwin")
    (load "mac-os.el"))

