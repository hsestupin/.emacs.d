;; Go: go-ts-mode (built-in tree-sitter) + eglot + gopls

(require 'treesit)
(require 'eglot)

;; Grammar sources. Install once per machine with
;; M-x treesit-install-language-grammar RET go RET (and again for gomod).
(add-to-list 'treesit-language-source-alist
             '(go "https://github.com/tree-sitter/tree-sitter-go"))
(add-to-list 'treesit-language-source-alist
             '(gomod "https://github.com/camdencheek/tree-sitter-go-mod"))

;; go-ts-mode registers these itself, but only in a plain top-level form with no
;; autoload cookie - so it never runs unless the file is already loaded.
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode))

;; go-ts-mode is already mapped to gopls in eglot-server-programs, so only the
;; server settings need setting. Keyed by :gopls, so this reaches gopls alone.
(setq-default eglot-workspace-configuration
              '(:gopls (:hoverKind "FullDocumentation"
                        :analyses (:shadow t
                                   :unusedparams t
                                   :unusedwrite t
                                   :nilness t))))

(defun my-go-eglot-before-save ()
  "Organize imports and gofmt the current buffer through gopls.
Silent when gopls offers no import action, which is the common case."
  (when (eglot-managed-p)
    (ignore-errors (eglot-code-action-organize-imports (point-min) (point-max)))
    (eglot-format-buffer)))

(defun my-go-ts-mode-setup ()
  ;; gofmt indents with tabs; 4 is only how wide they are shown
  (setq-local tab-width 4)
  (setq-local go-ts-mode-indent-offset 4)
  (add-hook 'before-save-hook 'my-go-eglot-before-save nil t)
  (eglot-ensure))

(add-hook 'go-ts-mode-hook 'my-go-ts-mode-setup)
