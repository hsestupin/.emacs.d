(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "C-SPC") #'company-complete)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
