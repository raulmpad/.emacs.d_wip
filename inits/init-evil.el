(evil-define-key 'normal global-map (kbd ", m") 'asok/find-tag-dwim)
(evil-define-key 'normal global-map (kbd ", s") 'ack-in-directory)
(evil-define-key 'normal enh-ruby-mode-map (kbd "<return>") 'asok/find-tag-dwim)
(evil-define-key 'normal enh-ruby-mode-map (kbd ", z") 'hs-toggle-hiding)