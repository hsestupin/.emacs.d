;; set fullscreen mode on startup  
(set-frame-parameter nil 'fullscreen 'fullboth)

;; Here comes nrepl
(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl)) 

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)

;; Macbook hooks :o
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(global-set-key (kbd "M-`") 'ns-next-frame)
