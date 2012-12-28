(define-key global-map (kbd "s-t") 'helm-rails-controllers)
(define-key global-map (kbd "s-y") 'helm-rails-models)
(define-key global-map (kbd "s-u") 'helm-rails-views)
(define-key global-map (kbd "s-o") 'helm-rails-specs)
(define-key global-map (kbd "s-r") 'helm-rails-all)


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



;; ****************************** Moving to splitted new window
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))
