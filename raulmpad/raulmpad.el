(define-key global-map (kbd "s-t") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)



;; ****************************** Window numering

(require 'window-numbering)

(defvar window-numbering-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s-0") 'select-window-0)
    (define-key map (kbd "s-1") 'select-window-1)
    (define-key map (kbd "s-2") 'select-window-2)
    (define-key map (kbd "s-3") 'select-window-3)
    (define-key map (kbd "s-4") 'select-window-4)
    (define-key map (kbd "s-5") 'select-window-5)
    (define-key map (kbd "s-6") 'select-window-6)
    (define-key map (kbd "s-7") 'select-window-7)
    (define-key map (kbd "s-8") 'select-window-8)
    (define-key map (kbd "s-9") 'select-window-9)
    map)
  "Keymap used in by `window-numbering-mode'.")

(window-numbering-mode 1)

;; ****************************** Full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)




;; ****************************** Add Urban Dictionary to webjump
(eval-after-load "webjump"
'(add-to-list 'webjump-sites
              '("Urban Dictionary" .
                [simple-query
                 "www.urbandictionary.com"
                 "http://www.urbandictionary.com/define.php?term="
                 ""])))
(global-set-key (kbd "C-x g") 'webjump)
