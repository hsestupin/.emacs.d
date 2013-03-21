;; My custom config

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; set fullscreen mode on startup  
(set-frame-parameter nil 'fullscreen 'fullboth)

;; Here comes clojure
(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl)) 

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)

(provide 'init-local)
