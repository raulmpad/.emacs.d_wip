(evil-define-key 'normal global-map (kbd ", m")			 'asok/find-tag-dwim)
(evil-define-key 'normal global-map (kbd ", s")			 'ack-in-directory)
(evil-define-key 'normal enh-ruby-mode-map (kbd "<return>")	 'asok/find-tag-dwim)
(evil-define-key 'normal enh-ruby-mode-map (kbd ", z")		 'hs-toggle-hiding)
(evil-define-key 'normal enh-ruby-mode-map (kbd "<return>")	 'asok/find-tag-dwim)
(evil-define-key 'normal dired-mode-map (kbd ", k")		 'dired-up-directory)
(evil-define-key 'normal dired-mode-map (kbd ", v")		 'dired-rspec-verify)
(evil-define-key 'normal dired-mode-map (kbd ", s")		 'dired-rspec-verify-single)
(evil-define-key 'normal global-map (kbd ", g")			 'magit-status)
(evil-define-key 'motion ruby-mode-map (kbd "*")		 'asok/evil-search-ruby-word-forward)
(evil-define-key 'normal global-map (kbd ", i") (kbd "C-x h ="))

;; Removes all evil setting when we're in "Insert Mode"
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
;; But we also need to be able to return to "Normal Mode" and delete properly
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-d") 'backward-delete-char-untabify)

(evil-mode 1)
