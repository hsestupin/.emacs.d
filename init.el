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
    ;; add some super usefull clojure functionality https://github.com/clojure-emacs/clj-refactor.el
    clj-refactor
    
    ;; Complete anything. http://company-mode.github.io/
    company
    
    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider 

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode
    
    ;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

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
    ido-ubiquitous
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

(load "flx/flx.el")
(load "flx/flx-ido.el")

(load "ido-setup.el")
;; CEDET setup
(load "cedet-setup.el")

;; Paredit mode setup
(load "paredit-setup.el")

;; Langauage-specific
(load "clojure-setup.el")

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
;; Load some Mac OS specific configurations. Redefine Meta-key, etc
(if (string-equal system-type "darwin")
    (load "mac-os.el"))

