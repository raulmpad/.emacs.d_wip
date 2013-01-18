;; IMPORTANT !!! ruby-dev needs pry and yard gems
(defun inf-ruby-keys () nil)

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" .    ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" .  ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" .  ruby-mode))

(setq enh-ruby-program "~/.rvm/rubies/ruby-1.9.3-p125/bin/ruby")

(require 'rvm)

(require 'ruby-block)

(evil-define-key 'normal ruby-mode-map (kbd "<return>") 'asok/find-tag-dwim)

(defun asok/bounds-of-ruby-word-at-point ()
	(save-excursion
		(skip-syntax-backward "w_")
			(if (looking-at "[:a-zA-Z0-9_]+")
				(cons (point) (match-end 0))
			nil)))

(defun asok/bounds-of-ruby-string-at-point ()
	(save-excursion
		(skip-syntax-backward "^\"")
			(if (looking-at ".+\\('\\|\"\\)")
		  	(cons (point) (- (match-end 0) 1))
		  nil)))

(put 'ruby-word   'bounds-of-thing-at-point 'asok/bounds-of-ruby-word-at-point)
(put 'ruby-string 'bounds-of-thing-at-point 'asok/bounds-of-ruby-string-at-point)

(evil-define-motion asok/evil-search-ruby-word-forward (count)
	"Search forward for ruby word under point."
	:jump t
	:type exclusive
	(dotimes (var (or count 1))
		(setq isearch-forward t)
			(evil-search (thing-at-point 'ruby-word) t evil-regexp-search)))
