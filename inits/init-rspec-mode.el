(defadvice rspec-verify-all (after rename-compilation-buffer ())
  "Rename compilation buffer to *compilation all*"
  (with-current-buffer rspec-compilation-buffer-name
    (rename-buffer "*compilation all*" t)))
(ad-activate 'rspec-verify-all)

(asok/enh-ruby-mode-add-keywords '("describe"
                                   "pending"
                                   "context"
                                   "specify"
                                   "shared_examples_for"
                                   "it_should_behave_like"
                                   "before"
                                   "it"
                                   "after"
                                   "background"
                                   "feature"
                                   "scenario")
                                 'enh-ruby-mode)

;; (define-key rspec-mode-verifible-keymap (kbd "s") 'rspec-verify-single)
(defun dired-rspec-verify-single ()
  (interactive)
  (rspec-compile (mapconcat 'identity (dired-get-marked-files) " ") (rspec-core-options)))
(defun dired-rspec-verify ()
  (interactive)
  (rspec-run-single-file (dired-current-directory) (rspec-core-options)))

;; Check this on el-get rspec-mode.el to enable debugging on buffer
;; Method: (defun rspec-compile (a-file-or-dir &optional opts)...
;; Move this line
;; (compile (mapconcat 'identity `(,(rspec-runner) ,a-file-or-dir ,(rspec-runner-options opts)) " ")))
;; to
;; (compile (mapconcat 'identity `(,(rspec-runner) ,(rspec-runner-options opts) ,a-file-or-dir) " ") t))
;; This also solves the problem with recent zeus versions whose conflicts with rspec-mode params enumeration.
