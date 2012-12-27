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