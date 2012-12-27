;; ******************************  10 BEGIN

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq ring-bell-function nil)
(setq visible-bell t)
(setq inhibit-startup-message t)



;; ****************************** Hombrew path added
(push "/usr/local/bin" exec-path)



;; ****************************** Set up load path
(add-to-list 'load-path user-emacs-directory)



;; ****************************** Custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)



;; ****************************** Mac configuration required??
(setq is-mac (equal system-type 'darwin))



;; ****************************** Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))



;; ****************************** Mac improvements
(require 'appearance)
(when is-mac (require 'mac))



;; ****************************** Weird symbols
(require 'symbols)



;; ****************************** Defuns load
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))
	
	
	
;; ****************************** Keybindings
(require 'keys)



;; ****************************** Package management. 
(require 'packages)
(setq inits-dir (expand-file-name "inits" user-emacs-directory))
(dolist (file (directory-files inits-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))



;; ****************************** Captain Hooks
(require 'hooks)



;; ****************************** Coding load
(setq coding-dir (expand-file-name "coding" user-emacs-directory))
(dolist (file (directory-files coding-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))



;; ****************************** Own last requirements
(setq own-lisp-dir
	(expand-file-name "raulmpad" user-emacs-directory))
(dolist (file (directory-files own-lisp-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'helm-rails)



