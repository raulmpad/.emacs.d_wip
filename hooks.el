;; Removes dos eol
(add-hook 'fundamental-mode-hook 'remove-dos-eol)

;; ruby mode hooks
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
(add-hook 'ruby-mode-hook (lambda () (ruby-block-mode t) (linum-mode t)))
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)

(wrap-region-global-mode t)

(require 'ruby-defuns)
(add-hook 'enh-ruby-mode-hook 'raulmpad/ruby-general-keywords)
(add-hook 'ruby-mode-hook 'raulmpad/ruby-apply-keywords)

;; auto-complete
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'shell-mode-hook 'asok/disable-completion-by-return)

;; haml mode hooks
(add-hook 'haml-mode-hook 'flymake-haml-load)

;; coffee mode hooks
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(provide 'hooks)
