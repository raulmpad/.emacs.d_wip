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

(defcustom raulmpad/ruby-general-keywords
  '("require" "scope" "include" "file_accessor" "extend" "scope" "workflow" "event" "observe" "require_relative" "attr_accessor" "attr_writer" "atrr_reader" "debugger" "gem" "feature" "scenario" "background" "skip_before_filter")
  "Own keywords"
  :group 'rinari
  :type '(repeat string))


;; Stolen from rinari
(defun raulmpad/highlight-keywords (keywords)
  "Highlight the passed KEYWORDS in current buffer.
Use `font-lock-add-keywords' in case of `ruby-mode' or
`ruby-extra-keywords' in case of Enhanced Ruby Mode."
  (if (boundp 'ruby-extra-keywords)
      (progn
	(setq ruby-extra-keywords (append ruby-extra-keywords keywords))
	(ruby-local-enable-extra-keywords))
    (font-lock-add-keywords
     nil
     (list (list
            (concat "\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b"
		    (regexp-opt keywords t)
		    ruby-keyword-end-re)
            (list 2 'font-lock-builtin-face))))))

(defun raulmpad/ruby-apply-keywords ()
  "Apply extra font lock keywords specific to models, controllers etc."
  (when (and rinari-fontify-rails-keywords (buffer-file-name))
    (loop for (re keywords) in `((".+\\.rb$" ,raulmpad/ruby-general-keywords))
          do (when (string-match-p re (buffer-file-name))
               (raulmpad/highlight-keywords keywords)))))


(provide 'ruby-defuns)
