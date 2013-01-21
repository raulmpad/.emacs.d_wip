(require 'ack-and-a-half)

(defalias 'ack			'ack-and-a-half)
(defalias 'ack-same		'ack-and-a-half-same)
(defalias 'ack-find-file	'ack-and-a-half-find-file)
(defalias 'ack-find-file-same	'ack-and-a-half-find-file-same)

(defun ack-in-directory (pattern &optional regexp directory)
  "Run ack inside a directory"
  (interactive (ack-and-a-half-interactive))
  (let ((ack-and-a-half-arguments (quote ("--type=ruby"
					  "--type=lisp"
					  "--type=text"
					  "--type=html"
					  "--type=js"
					  "--type=css"
					  "--type=yaml"
					  "--type=xml"
					  "--type-add html=.haml"
					  "--type-add css=.sass,.scss"
					  "--ignore-dir=tmp"
					  "--ignore-dir=coverage"))))
    (ack-and-a-half-run (read-directory-name "directory to look in") regexp pattern)))

					;Stolen from https://github.com/remvee/emacs-rails/blob/master/rails-project.el
(defun mrm/root ()
  "Return RAILS_ROOT if this file is a part of a Rails application,
	else return nil"
  (let ((curdir default-directory)
	(max 6)
	(found nil))
    (while (and (not found) (> max 0))
      (progn
	(if (file-exists-p (concat curdir "config/environment.rb"))
	    (progn
	      (setq found t))
	  (progn
	    (setq curdir (concat curdir "../"))
	    (setq max (- max 1))))))
    (if found (expand-file-name curdir))))

(defun mrm/ack-project (pattern &optional regexp directory)
  (interactive (ack-and-a-half-interactive))
  (let ((ack-and-a-half-arguments (quote ("--type=ruby"
					  "--type=html"
					  "--type=js"
					  "--type=css"
					  "--type=yaml"
					  "--type-add html=.haml"
					  "--type-add css=.sass,.scss"
					  "--ignore-dir=tmp"
					  "--ignore-dir=coverage"))))
    (ack-and-a-half-run (mrm/root) regexp pattern)))
