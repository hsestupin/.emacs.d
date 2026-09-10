(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
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
    ;; Complete anything. http://company-mode.github.io/
    company
       
    ;; git integration
    magit

    ;; Projectile. Helps you to manage project management. Basically was installed to find files inside a project and switching betweeb *.cpp/*.h files.
    projectile

    ;; Markdown highlighting
    markdown-mode

    ;; Super usefull and tiny emacs extentions. Thanks to @bbatsov - https://github.com/bbatsov/crux
    crux

    ;; consult-imenu: flat, filterable jump-to-symbol list. https://github.com/minad/consult
    consult

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

;; display ido completions vertically
;(when (not (package-installed-p 'ido-vertical-mode))
;    (package-install 'ido-vertical-mode))

;(require 'ido)

;; (setq ido-enable-prefix nil
;;       ido-enable-flex-matching t
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point 'guess
;;       ido-max-prospects 10
;;       ido-default-file-method 'selected-window
;;       ido-auto-merge-work-directories-length -1)
;; (ido-mode +1)

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; Default lisp mode customizations
(load "lisp-mode-setup.el")

(load "magit-setup.el")
(load "projectile-setup.el")

(load "ggtags-setup.el")
(load "eglot-setup.el")
(load "misc.el")

;; Go development, needs gopls on PATH
(load "go-setup.el")

;; Load some Mac OS specific configurations. Redefine Meta-key, etc
(if (string-equal system-type "darwin")
    (load "mac-os.el"))


;; experiments

(fido-vertical-mode 1)


;; ergonomic keystrokes (many of them are shared with Intellij Idea)

;; IntelliJ's File Structure. Replaces tab-to-tab-stop on M-i.
(global-set-key (kbd "M-i") 'consult-imenu)
(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "M-o") 'next-multiframe-window)

(with-eval-after-load 'prog-mode
  (keymap-unset prog-mode-map "M-q" t))
(global-set-key (kbd "M-q") 'kill-buffer-and-window)
(global-set-key (kbd "C-q") 'kill-current-buffer)
(global-set-key (kbd "M-e") 'switch-to-buffer)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "RET") 'newline)


(global-set-key (kbd "C-n") 'recenter-top-bottom)
