(with-eval-after-load 'ggtags
  (local-set-key (kbd "M-,") 'pop-tag-mark))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

