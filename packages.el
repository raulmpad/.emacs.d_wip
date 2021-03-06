(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq el-get-user-package-directory "~/.emacs.d/inits/")

(setq el-get-sources
      '(
        (:name ack-and-a-half
               :type github
               :pkgname "jhelwig/ack-and-a-half")

        (:name magit
               :website "https://github.com/magit/magit#readme"
               :description "It's Magit! An Emacs mode for Git."
               :type github
               :pkgname "magit/magit"
               :info "."
               ;; let el-get care about autoloads so that it works with all OSes
               :build `(("make",(format "EMACS=%s" el-get-emacs) "all"))
               :build/berkeley-unix (("touch" "`find . -name Makefile`") ("gmake")))

        (:name wgrep
               :type github
               :pkgname "mhayashi1120/Emacs-wgrep"
               :branch "BR-ack-support")

        (:name helm-git
               :type github
               :pkgname "maio/helm-git"
               :features (helm-git))

        (:name flymake-easy
               :type elpa)

        (:name flymake-coffee
               :type github
               :pkgname "purcell/flymake-coffee")

        (:name readline-complete
               :type github
               :pkgname "monsanto/readline-complete.el")

        (:name ruby-dev
               :type git
               :url "git://github.com/Mon-Ouie/ruby-dev.el.git")

        (:name thingatpt+
               :type emacswiki
               :load "thingatpt+.el")

        (:name Enhanced-Ruby-Mode
               :description "Replacement for ruby-mode which uses ruby 1.9's Ripper to parse and indent"
               :type github
               :pkgname "jacott/Enhanced-Ruby-Mode"
               :features ruby-mode
               :post-init (progn (load-library "ruby-mode")))

        (:name evil
               :website "http://gitorious.org/evil/pages/Home"
               :description "Evil is an extensible vi layer for Emacs. It emulates the main features of Vim, and provides facilities for writing custom extensions."
               :type git
               :url "git://gitorious.org/evil/evil.git"
               :features evil
               :depends undo-tree)

        (:name milkypostman-powerline
               :type github
               :pkgname "milkypostman/powerline"
               :prepare (progn
                          (require 'powerline)
                          (powerline-default)))
        )
      )

(el-get 'sync '(evil-surround
								evil-rails
								smex
								helm
								projectile
								ace-jump-mode
								ido-ubiquitous
								inf-ruby
								flymake
								flymake-cursor
								flymake-css
								flymake-haml
								flymake-sass
								flymake-ruby
								js-comint
								ruby-end
								ruby-block
								rspec-mode
								rvm
								rinari
								bundler
								quickrun
								yaml-mode
								haml-mode
								coffee-mode
								json
								mmm-mode
								web-mode
								auto-complete
								auto-complete-ruby
								auto-complete-css
								expand-region
								yasnippet
								wrap-region
								;;nxhtml
								egg
								clojure-mode
								nrepl
								ac-nrepl
								twilight-anti-bright-theme
								twilight-bright-theme)
								(mapcar 'el-get-source-name el-get-sources) '())

				(provide 'packages)
