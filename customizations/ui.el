;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
;; Disable annoying toolbars above
(tool-bar-mode -1)

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)


;; set fullscreen mode on startup
(set-frame-parameter nil 'fullscreen 'fullboth)

;; Turn off both vertical and horizontal scrollbars
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; Select another window in cyclic ordering of windows with "M-`"
(global-set-key (kbd "M-`") 'other-window)

(global-set-key (kbd "<C-tab>") 'next-multiframe-window)
(global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)
