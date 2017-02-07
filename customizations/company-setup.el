(add-hook 'after-init-hook 'global-company-mode)

;; in Mac OS terminal doesn't recognize ctrl-space keystroke
(if (string-equal system-type "darwin")
    (global-set-key (kbd "C-@") #'company-complete)
    (global-set-key (kbd "C-SPC") #'company-complete))

(with-eval-after-load 'company	  
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)

  (setq company-idle-delay 0.5)

  (custom-set-variables
   `(company-tooltip-align-annotations t))
  
  (custom-set-faces
   `(company-tooltip ((t :background "lightgray" :foreground "black")))
   `(company-tooltip-selection ((t :background "steelblue" :foreground "white")))
   `(company-tooltip-mouse ((t :background "blue" :foreground "white")))
   `(company-tooltip-common ((t :background "lightgray" :foreground "black")))
   `(company-tooltip-common-selection ((t t :background "lightgray" :foreground "black")))
   ;; `(company-tooltip-annotation ((t :background "" :foreground "")))
   `(company-scrollbar-fg ((t :background "black")))
   `(company-scrollbar-bg ((t :background "gray")))
   `(company-preview ((t :background nil :foreround "darkgray")))
   `(company-preview-common ((t :background nil :foreground "darkgray")))))
