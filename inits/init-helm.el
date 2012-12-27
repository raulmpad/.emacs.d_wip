(require 'helm-mode)

(global-set-key (kbd "s-t") 'asok/helm-mini)

(defvar helm-c-source-asok-config-files
  '((name . "My config files")
    (type . file)
    (disable-shortcuts)
    (init . (lambda ()
              (helm-init-candidates-in-buffer
               'local
               (append (directory-files "~/.emacs.d/" t "\\.el$")
							 				 (directory-files "~/.emacs.d/raulmpad/" t "\\.el$")
							 				 (directory-files "~/.emacs.d/coding/" t "\\.el$")
											 (directory-files "~/.emacs.d/inits/" t "\\.el$")))))
    (candidates-in-buffer)
    (help-message . helm-generic-file-help-message)
    (mode-line . helm-generic-file-mode-line-string)))

(defun asok/helm-mini ()
  "Same as `helm-mini' but with extra source for config files"
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-recentf
                       helm-c-source-asok-config-files
                       helm-c-source-buffer-not-found)
                     "*helm mini*"))