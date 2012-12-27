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

(asok/enh-ruby-mode-add-keywords '("include"
                                   "extend"
                                   "require"
                                   "require_relative"
                                   "attr_accessor"
                                   "attr_writer"
                                   "atrr_reader"
                                   "debugger"
                                   "gem")
                                 'enh-ruby-mode)

(add-to-list
	'hs-special-modes-alist
	'(enh-ruby-mode
		"class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
		"end"
		"#"
		enh-ruby-end-of-block
		nil))