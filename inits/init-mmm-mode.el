;; Multiple Major modes in one buffer

(require 'mmm-auto)

(setq mmm-global-mode 'auto)

(add-to-list 'mmm-mode-ext-classes-alist  '(html-erb-mode "\\.html\\.erb\\'" erb))
(add-to-list 'mmm-mode-ext-classes-alist  '(html-erb-mode nil html-js))
(add-to-list 'mmm-mode-ext-classes-alist  '(html-erb-mode nil html-css))

(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . html-erb-mode))

;; (setq mmm-submode-decoration-level 0
;;        mmm-parse-when-idle t)
