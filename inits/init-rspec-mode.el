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