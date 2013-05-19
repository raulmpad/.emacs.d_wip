; (add-to-list 'load-path "~/.emacs.d/plugins/lintnode")
; 
; (require 'flymake-jslint)
; ;; Make sure we can find the lintnode executable
; (setq lintnode-location "~/.emacs.d/plugins/lintnode")
; ;; JSLint can be... opinionated
; (setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
; ;; Start the server when we first open a js file and start checking
; (add-hook 'js-mode-hook
;           (lambda ()
;             (lintnode-hook)))

(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
						 (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

;; Tab indentation
(setq js-indent-level 2)
