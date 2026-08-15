;; Eglot: built-in LSP client (Emacs 29+). Replaces lsp-mode/lsp-ui.

(require 'eglot)

;; LSP servers are chatty; these help with any of them
(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 1024 1024))

;; Kill the server when its last buffer is closed
(setq eglot-autoshutdown t)

;; Don't let a slow server block typing
(setq eglot-sync-connect 1)

;; eglot has no sideline; docs go through eldoc. Keep the echo area small and
;; use C-c l d for the full doc buffer.
(setq eldoc-echo-area-use-multiline-p 1)

;; Same prefix lsp-mode used, since s-l is swallowed by GNOME anyway
(defvar my-eglot-map (make-sparse-keymap)
  "Keymap for eglot commands, bound under C-c l.")

(define-key my-eglot-map (kbd "r") 'eglot-rename)
(define-key my-eglot-map (kbd "a") 'eglot-code-actions)
(define-key my-eglot-map (kbd "f") 'eglot-format-buffer)
(define-key my-eglot-map (kbd "o") 'eglot-code-action-organize-imports)
(define-key my-eglot-map (kbd "d") 'eldoc-doc-buffer)
(define-key my-eglot-map (kbd "n") 'flymake-goto-next-error)
(define-key my-eglot-map (kbd "p") 'flymake-goto-prev-error)
(define-key my-eglot-map (kbd "l") 'flymake-show-buffer-diagnostics)
(define-key my-eglot-map (kbd "R") 'eglot-reconnect)
(define-key my-eglot-map (kbd "s") 'eglot-shutdown)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c l") my-eglot-map))

;; Python: ty via uv
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-base-mode . ("uv" "run" "ty" "server"))))

(add-hook 'python-base-mode-hook 'eglot-ensure)
