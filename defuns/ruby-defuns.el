(require 'ruby-mode)

(defun asok/enh-ruby-mode-add-keywords (keywords mode)
  (font-lock-add-keywords
   mode
   (list (list
	  (concat "\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b"
		  (regexp-opt keywords t)
		  ruby-keyword-end-re)
	  (list 2 font-lock-keyword-face)))))