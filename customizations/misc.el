
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Setup yasnippets
(require 'yasnippet)
(yas-global-mode 1)

; enable beautiful parenthesis highlighting
(show-paren-mode 1)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)
