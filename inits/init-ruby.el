;; IMPORTANT !!! ruby-dev needs pry and yard gems
(defun inf-ruby-keys () nil)

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(require 'rvm)

(require 'ruby-block)