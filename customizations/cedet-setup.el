(defconst cedet-dir "~/src/cedet/")

(load-file (concat cedet-dir "cedet-devel-load.el"))
;(load-file (concat cedet-dir "contrib/cedet-contrib-load.el"))
;;(add-to-list 'load-path "~/projects/cedet-bzr/contrib/")
(add-to-list 'Info-directory-list (concat cedet-dir "doc/info"))

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)

(setq semantic-symref-tool 'global)
;; Activate semantic
(semantic-mode 1)

;; Implementing my own copy of this function since it is required by
;; semantic-ia-fast-jump but this function is not defined in etags.el
;; of GNU emacs
(require 'etags)
(unless (fboundp 'push-tag-mark)
  (defun push-tag-mark ()
    "Push the current position to the ring of markers so that
    \\[pop-tag-mark] can be used to come back to current position."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))))

;; customisation of modes
(defun hsestupin/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key (kbd "M-j") 'semantic-ia-fast-jump)
  ;; going back from previous semantic-ia-fast-jump
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

(add-hook 'c-mode-common-hook 'hsestupin/cedet-hook)
(add-hook 'lisp-mode-hook 'hsestupin/cedet-hook)
(add-hook 'scheme-mode-hook 'hsestupin/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'hsestupin/cedet-hook)
(add-hook 'erlang-mode-hook 'hsestupin/cedet-hook)
(add-hook 'python-mode-hook 'hsestupin/cedet-hook)
