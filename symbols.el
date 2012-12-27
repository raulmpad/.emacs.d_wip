;; All symbols are UTF-8 compatible

(defun insert-antidash ()
  "Insert an antidash symbol"
  (interactive)
  (ucs-insert #x5c))
(global-set-key (kbd "M-º") 'insert-antidash)

(defun insert-pipe ()
  "Insert a pipe symbol."
  (interactive)
  (ucs-insert #x7c))
(global-set-key (kbd "M-1") 'insert-pipe)

(defun insert-at ()
  "Insert an at symbol."
  (interactive)
  (ucs-insert #x40))
(global-set-key (kbd "M-2") 'insert-at)

(defun insert-pound ()
  "Insert a Pound currency symbol."
  (interactive)
  (ucs-insert #x23))
(global-set-key (kbd "M-3") 'insert-pound)

(defun insert-euro ()
  "Insert a Euro currency symbol."
  (interactive)
  (ucs-insert #x20ac))
(global-set-key (kbd "M-e") 'insert-euro)

(defun insert-right_curly ()
  "Insert a right curly brace."
  (interactive)
  (ucs-insert #x7d))
(global-set-key (kbd "M-ç") 'insert-right_curly)

(defun insert-right_square ()
  "Insert a left right bracket."
  (interactive)
  (ucs-insert #x5d))
(global-set-key (kbd "M-+") 'insert-right_square)

(defun insert-left_square ()
  "Insert a left square bracket."
  (interactive)
  (ucs-insert #x5b))
(global-set-key (kbd "M-`") 'insert-left_square)


(provide 'symbols)