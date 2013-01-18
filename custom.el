;; Custom.el
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("eacf43271f6e4bf00654862e6071f87b8484f74066d5c9712fb217b32ba5677a" default)))
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rvm t))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erm-syn-errline ((t (:underline "Red"))))
 '(erm-syn-warnline ((t (:underline "Orange"))))
 '(helm-selection ((t (:underline "Yellow"))))
 '(magit-diff-del ((t (:inherit diff-removed :foreground "#ff6666"))) nil "Custom diff color")
 '(magit-item-highlight ((t (:inherit nil))))
 '(ruby-op-face ((t (:foreground "Magenta" :weight bold))))
 '(yas/field-highlight-face ((t (:inherit (quote highlight)))) t))

