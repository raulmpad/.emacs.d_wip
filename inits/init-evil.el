(evil-define-key 'normal global-map (kbd ", c") 'quickrun)
(evil-define-key 'normal global-map (kbd ", b") 'magit-blame-mode)
(evil-define-key 'normal global-map (kbd ", w") 'make-frame-command)
(evil-define-key 'normal global-map (kbd ", r") 'rspec-verify)
(evil-define-key 'normal global-map (kbd ", t") 'rspec-verify-single)
(evil-define-key 'normal global-map (kbd ", s") 'mrm/ack-project)
(evil-define-key 'normal global-map (kbd ", i") 'indent-indent)
(evil-define-key 'normal global-map (kbd ", o") 'helm-occur)
(evil-define-key 'normal global-map (kbd ", a") (kbd "C-x h"))
(evil-define-key 'normal global-map (kbd ", d") 'duplicate-line)
(evil-define-key 'normal global-map (kbd ", k") 'move-up-line)
(evil-define-key 'normal global-map (kbd ", j") 'move-down-line)
(evil-define-key 'normal global-map (kbd ", n") 'current-buffer-name)
(evil-define-key 'normal global-map (kbd ", ,") 'er/expand-region)
(evil-define-key 'normal global-map (kbd "C-f v") 'rinari-find-view)
(evil-define-key 'normal global-map (kbd "C-f e") 'rinari-find-environment)
(evil-define-key 'normal global-map (kbd "C-f c") 'rinari-find-controller)
(evil-define-key 'normal global-map (kbd "C-f l") 'rinari-find-log)
(evil-define-key 'normal global-map (kbd "C-f m") 'rinari-find-model)
(evil-define-key 'normal global-map (kbd "C-f f") 'ag-project)
(evil-define-key 'normal global-map (kbd "C-f g") 'ag-regexp-project-at-point)
(evil-define-key 'normal enh-ruby-mode-map (kbd "<return>")	 'asok/find-tag-dwim)
(evil-define-key 'normal enh-ruby-mode-map (kbd ", z")		 'hs-toggle-hiding)
(evil-define-key 'normal dired-mode-map (kbd ", k")		 'dired-up-directory)
(evil-define-key 'normal dired-mode-map (kbd ", v")		 'dired-rspec-verify)
(evil-define-key 'normal global-map (kbd ", g")			 'magit-status)
(evil-define-key 'motion ruby-mode-map (kbd "*")		 'asok/evil-search-ruby-word-forward)



;; Removes all evil setting when we're in "Insert Mode"
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
;; But we also need to be able to return to "Normal Mode" and delete properly
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-d") 'backward-delete-char-untabify)

;; Exit insert mode with "kj"
(define-key evil-insert-state-map "k" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(evil-mode 1)
