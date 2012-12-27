(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; ****************************** Helps ido with recent called methods
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)