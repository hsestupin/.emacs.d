;; Awesome git-gutter hydra to help you manage you changes chunk by chunk
(global-set-key
 (kbd "C-c h g")

 (defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
				       :hint nil)
   "
Git gutter:
  _n_: next hunk        _s_tage hunk     _q_uit
  _p_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   p_o_pup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
   ("n" git-gutter:next-hunk)
   ("p" git-gutter:previous-hunk)
   ("h" (progn (goto-char (point-min))
	       (git-gutter:next-hunk 1)))
   ("l" (progn (goto-char (point-min))
	       (git-gutter:previous-hunk 1)))
   ("s" git-gutter:stage-hunk)
   ("r" git-gutter:revert-hunk)
   ("o" git-gutter:popup-hunk)
   ("R" git-gutter:set-start-revision)
   ("q" nil :color blue)
   ("Q" (progn (git-gutter-mode -1)
	       ;; git-gutter-fringe doesn't seem to
	       ;; clear the markup right away
	       (sit-for 0.1)
	       (git-gutter:clear))
    :color blue)))
