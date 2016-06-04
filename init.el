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
    
    ;; ac-cider is a completion source for Emacs auto-complete package
    ;; that uses CIDER (and Compliment) as candidates provider
    ac-cider

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

;; Paredit mode setup
(load "paredit-setup.el")

;; Langauage-specific
(load "setup-clojure.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; Load some Mac OS specific configurations. Redefine Meta-key, etc
(if (string-equal system-type "darwin")
    (load "mac-os.el"))
