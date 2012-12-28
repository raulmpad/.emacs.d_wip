;; ****************************** Windows

(global-set-key [s-left] 'windmove-left) 
(global-set-key [s-right] 'windmove-right) 
(global-set-key [s-up] 'windmove-up) 
(global-set-key [s-down] 'windmove-down)



;; ****************************** Buffers

;; easily remove buffer
(global-set-key (kbd "s-k") (kbd "C-x k RET"))

;; create new scratch buffer
(global-set-key (kbd "C-c n") 'create-scratch-buffer)

;; current buffer name
(global-set-key (kbd "C-n") 'current-buffer-name)

;; Zooming
(defun my-zoom (n)
	"Increase or decrease font size based upon argument"
	(set-face-attribute 'default (selected-frame) :height
	(+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))
(global-set-key (kbd "C-+")      '(lambda nil (interactive) (my-zoom 1)))
(global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
(global-set-key (kbd "C-_")      '(lambda nil (interactive) (my-zoom -1)))
(global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1)))
(message "All done!")

(global-set-key (kbd "s-d") 'previous-buffer)
(global-set-key (kbd "s-f") 'next-buffer)


;; ****************************** Edit

;; Goto line
(global-set-key (kbd "s-l") 'goto-line)

;; Cut
(global-set-key (kbd "s-x") (kbd "C-w"))

;; Expanding region
(global-set-key (kbd "s-,") 'expand-region)
(global-set-key (kbd "C-s-,") 'contract-region)



;; ****************************** Search

(global-set-key (kbd "C-c e") 'ack-in-directory)
(global-set-key (kbd "s-a") 'asok/helm-mini)



;; ****************************** Packages

;; init magit-status
(global-set-key (kbd "C-c C-g") 'magit-status)

;; jump !!
(global-set-key (kbd "s-j") 'ace-jump-mode)

;; auto-complete



;; ****************************** Unsets...
;;(global-unset-key (kbd "s-t")) ;;  Now it's helm mini buffer @ init-helm.el


(provide 'keys)

