;; Macbook hooks :o
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(global-set-key (kbd "M-`") 'ns-next-frame)

;; add clojruescript support
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Extend exec-path with /usr/local/bin
(add-to-list 'exec-path "~/bin")
