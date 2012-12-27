;; Comment line no matter what...
;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (not (region-active-p))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

;; Expand region
(defun expand-region-init ()
  (global-set-key (kbd "s-,") 'er/expand-region)
  (require 'ruby-mode-expansions))
  
;; Thanks to "rtags `find . -name '*.rb'`"
(defun asok/find-tag-dwim ()
	(interactive)
	(let ((thing (thing-at-point 'symbol)))
				(condition-case nil
					(pop-to-buffer (find-tag-noselect thing))
	      ('error (find-tag thing)))))
