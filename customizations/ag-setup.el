(setq grep-find-ignored-files (delete-dups
			       (append grep-find-ignored-files '("*.exe" "*.pdb" "*.ogd.*"))))

