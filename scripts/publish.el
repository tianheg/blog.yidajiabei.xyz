;; load env
(load "~/.emacs.d/init.el")

;; https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
(require 'ox-publish)

;; https://bastibe.de/2014-05-07-speeding-up-org-publishing.html
(remove-hook 'find-file-hooks 'vc-find-file-hook 'vc-refresh-state)

(setq org-publish-project-alist
      '(("pages"
         :base-directory "~/org/"
         :publishing-directory "~/repo/blog/"
         :exclude "~/org/gtd/"
         :recursive t
         :html-head-include-default-style nil
         :html-head ""
         :publishing-function org-html-publish-to-html
         :html-postamble nil
         :with-toc 't)
        ("site" :components ("pages"))))

;; (progn (profiler-start 'cpu) (org-publish-project "site") (profiler-report) (profiler-stop))
(org-publish-project "site")
