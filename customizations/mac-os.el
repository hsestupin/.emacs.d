
;; Macbook hooks :o
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier 'super)

;; add clojruescript support
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Extend exec-path with /usr/local/bin
(add-to-list 'exec-path "~/bin")
(add-to-list 'exec-path "/usr/local/bin")

(global-set-key (kbd "<s-return>") #'smex)
