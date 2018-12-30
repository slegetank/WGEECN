(defun WGEECN/export-org-to-html (org-name)
  "Export org file to html for WGEECN."
  (let ((org-path (format "../%s" org-name)))
    (with-current-buffer (or (find-buffer-visiting org-name) (find-file org-path))
      (setq local-enable-local-variables nil)
      ;; modify relative path
      (goto-char (point-min))
      (replace-regexp "file:resource" "file:../resource" )
      ;; export
      (let ((file (org-export-output-file-name ".html" nil "html"))
            (org-export-coding-system org-html-coding-system))
        (org-export-to-file 'html file))
      (set-buffer-modified-p nil)
      (kill-buffer org-name))))

(WGEECN/export-org-to-html "4.org")

;;; export all orgs to htmls
;; (let ((org-files (directory-files ".." nil "\\.org$")))
;;     (dolist (org-name org-files nil)
;;       (message "Export %s ..." org-name)
;;       (WGEECN/export-org-to-html org-name)))
