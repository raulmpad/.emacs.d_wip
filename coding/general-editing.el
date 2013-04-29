;; ****************************** Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; ===== Set standard indent to 2 rather that 4 ====
;; (defcustom standard-indent 2
;;   "Default number of columns for margin-changing functions to indent."
;;   :group 'indent
;;   :type 'integer)

;; (defcustom tab-stop-list
;;   '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50)
;;   "List of tab stop positions used by `tab-to-tab-stop'.
;; This should be a list of integers, ordered from smallest to largest."
;;   :group 'indent
;;   :type '(repeat integer))
;; (put 'tab-stop-list 'safe-local-variable 'listp)
