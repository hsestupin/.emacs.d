;; Nix: nix-ts-mode (tree-sitter) + eglot + nixd

(require 'treesit)
(require 'eglot)

;; Grammar source. Install once per machine with
;; M-x treesit-install-language-grammar RET nix RET
(add-to-list 'treesit-language-source-alist
             '(nix "https://github.com/nix-community/tree-sitter-nix"))

;; nix-ts-mode registers no auto-mode-alist entry itself. The mode is autoloaded, so
;; naming it here is enough - no `require' needed.
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))

;; nixd is not installed anywhere, so run it straight out of nixpkgs. This entry has to
;; win over eglot's built-in nix-mode one, which looks for nil/rnix-lsp/nixd on PATH and
;; fails; add-to-list prepends and eglot takes the first match, so it does.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(nix-ts-mode . ("nix" "--extra-experimental-features" "nix-command flakes"
                                "run" "nixpkgs#nixd"))))

;; nixd evaluates these to answer completion and hover. :options is what makes NixOS
;; option names complete inside configuration.nix; the first completion there evaluates
;; the whole module system and takes a few seconds. :command has to be a vector, or it
;; encodes as a JSON object rather than an array.
(defvar my-nixd-settings
  '(:nixpkgs (:expr "import <nixpkgs> { }")
    :formatting (:command ["nix" "--extra-experimental-features" "nix-command flakes"
                           "run" "nixpkgs#nixfmt" "--" "-"])
    :options (:nixos (:expr "(import <nixpkgs/nixos> { configuration = /home/sstupin/nixos-config/configuration.nix; }).options")))
  "Workspace configuration for the nixd language server.")

;; go-setup.el sets the :gopls key of this same variable, and eglot only ever reads its
;; default value - never a buffer-local one. So extend the plist instead of replacing it.
;; append rather than plist-put, because go-setup.el's value is a quoted literal.
(setq-default eglot-workspace-configuration
              (append (default-value 'eglot-workspace-configuration)
                      (list :nixd my-nixd-settings)))

(add-hook 'nix-ts-mode-hook 'eglot-ensure)
