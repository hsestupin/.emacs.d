(require 'lisp-mode)

(add-hook 'lisp-mode-hook 'eldoc-mode)

(global-set-key (kbd "C-M-|") 'indent-sexp)
