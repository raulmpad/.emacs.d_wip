(defun asok/rinari-open-log ()
  (interactive)
  (find-file
   (concat (rinari-root)
           "log/"
           (ido-completing-read "Open log: " (directory-files (concat (rinari-root) "log/") nil "[^.|^..]"))))
  (rinari-minor-mode t)
  (auto-revert-tail-mode 1)
  (setq auto-revert-verbose nil))

(defun asok/insert-string (regexp word string)
  "Inserts string after the catched regexp in the word"
  (let ((pos (if (string-match-p "/" word)
                 (+ (string-match "/.*$" word) 1)
               0)))
    (concat (substring word 0 pos) string (substring word pos))))

(defun asok/substring-of-regexp (regexp word)
  "Returns substring of word starting from beginning of matched regexp till end"
  (substring word (+ (string-match regexp word) 1) (match-end 1)))

(defun asok/find-partial-or-template (word)
  (let ((word (replace-regexp-in-string "['\"]" "" (replace-regexp-in-string "^/" "" word)))
        (path (concat (rinari-root) "app/views/"))
        (cur-format (asok/substring-of-regexp "\.\\(js\\|html\\|text\\|csv\\|pdf\\)\." buffer-file-name)))
    (loop for file in  (list (concat path word) ; users/user.html.erb -> user.html.erb
                             (concat path word "." cur-format ".erb") ; users/user -> .../user.html.erb
                             (concat path word "." cur-format ".haml") ; users/user -> .../user.html.haml
                             (concat default-directory "_" word) ; user.html.erb -> .../_user.html.erb
                             (concat default-directory "_" word "." cur-format ".erb") ; user -> ./_user.html.erb
                             (concat default-directory "_" word "." cur-format ".haml") ; user -> ./_user.html.haml
                             (concat default-directory word "." cur-format ".erb") ; user -> ./user.html.erb
                             (concat default-directory word "." cur-format ".haml") ; user -> ./user.html.erb
                             (concat path (asok/insert-string "/.*$" word "_")) ; users/_user.html.erb
                             (concat path (asok/insert-string "/.*$" word "_") "." cur-format ".erb") ; users/user -> users/_user.html.erb
                             (concat path (asok/insert-string "/.*$" word "_") "." cur-format ".haml") ; users/user -> users/_user.html.haml
                             (concat path (asok/insert-string "/.*$" word "_") ".erb") ; users/user.html -> users/_user.html.erb
                             (concat path (asok/insert-string "/.*$" word "_") ".haml")) ; users/user.html -> users/_user.html.haml
          do (if (file-exists-p file) (return (find-file file))))))

(defadvice asok/find-tag-dwim (around asok/find-view-or-find-tag-dwim activate)
  (let ((thing (thing-at-point 'ruby-string)))
    (if (and thing (string-match-p " render\\( \\|(\\)" (buffer-substring (point-at-bol) (point-at-eol))))
	(asok/find-partial-or-template thing)
      ad-do-it)))


(defun asok/rinari-regenerate-tags ()
  (interactive)
  (async-shell-command (format "cd %s ; rtags `find . -name '*.rb'`" (rinari-root))))

(add-to-list 'rinari-model-keywords "alias_attribute")
(add-to-list 'rinari-model-keywords "workflow")

(add-hook 'rinari-minor-mode-hook '(lambda () (asok/ruby-mode-add-keywords '("with_options"
                                                                             "delegate") nil)))

(defun asok/rinari-find-file (path)
  (find-file (concat (rinari-root) path)))

(defvar asok/rinari-shortcut-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s") '(lambda () (interactive) (asok/rinari-find-file "db/schema.rb")))
    (define-key map (kbd "r") '(lambda () (interactive) (asok/rinari-find-file "config/routes.rb")))
    (define-key map (kbd "h") '(lambda () (interactive) (asok/rinari-find-file "spec/spec_helper.rb")))
    (define-key map (kbd "g") '(lambda () (interactive) (asok/rinari-find-file "Gemfile")))
    map))

(defun asok/rinari-ack (pattern &optional regexp directory)
  (interactive (ack-and-a-half-interactive))
  (let ((ack-and-a-half-arguments (quote ("--type=ruby"
					  "--type=html"
					  "--type=js"
					  "--type=css"
					  "--type-add html=.haml"
					  "--type-add css=.sass,.scss"
					  "--ignore-dir=tmp"
					  "--ignore-dir=coverage"))))
  (ack-and-a-half-run (rinari-root) regexp pattern)))

(evil-define-key 'normal rinari-minor-mode-map (kbd ", a") 'asok/rinari-ack
  (kbd ", h") asok/rinari-shortcut-map)
