;; ****************************** Settings decorations and bells...
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)



;; ****************************** Highlight current line
(global-hl-line-mode -1)



;; ****************************** Highlight matching parentheses when the point is on them.
(show-paren-mode 1)
(winner-mode 1)



;; ****************************** No menu bars
(menu-bar-mode -1)



;; ****************************** Ditch them scrollbars
(scroll-bar-mode -1)


(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))
(tooltip-mode 1)
(blink-cursor-mode 1)


;; ****************************** My prefered theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'misterioso t nil)



;; ****************************** Yellow Cursor
(set-cursor-color "yellow")



(provide 'appearance)
