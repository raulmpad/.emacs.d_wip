;; Custom.el
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-buffer+size-width 80)
 '(custom-safe-themes (quote ("159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "eacf43271f6e4bf00654862e6071f87b8484f74066d5c9712fb217b32ba5677a" default)))
 '(helm-buffer-max-length 60)
 '(helm-full-frame nil)
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-opts-file-when-available t)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rvm t)
 '(tab-width 2))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erm-syn-errline ((t (:underline "Red"))))
 '(erm-syn-warnline ((t (:underline "Orange"))))
 '(helm-selection ((t (:underline "Yellow"))))
 '(magit-diff-del ((t (:inherit diff-removed :foreground "ff6666"))))
 '(magit-item-highlight ((t (:inherit nil))))
 '(ruby-op-face ((t (:foreground "Magenta" :weight bold))))
 '(yas/field-highlight-face ((t (:inherit (quote highlight)))) t))

