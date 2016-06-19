(require 'crux)

(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
;; Same as go to the end of the line and then (new-line)
(global-set-key [(shift return)] #'crux-smart-open-line)
(global-set-key [remap kill-whole-line] #'crux-kill-whole-line)
