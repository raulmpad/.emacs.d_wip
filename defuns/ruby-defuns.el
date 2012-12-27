(require 'ruby-mode)

(defun asok/enh-ruby-mode-add-keywords (keywords mode)
  (font-lock-add-keywords
   mode
   (list (list
	  (concat "\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b"
		  (regexp-opt keywords t)
		  ruby-keyword-end-re)
	  (list 2 font-lock-keyword-face)))))
		
(defun dired-rspec-verify ()
	(interactive)
	(rspec-run-single-file (dired-current-directory) (rspec-core-options)))

(defun dired-rspec-verify ()
	(interactive)
	(rspec-run-single-file (dired-current-directory) (rspec-core-options)))
