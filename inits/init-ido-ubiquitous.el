(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode)

(provide 'inits/ido)