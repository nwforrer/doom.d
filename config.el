;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq +workspaces-on-switch-project-behavior t) ;; always create new workspace for project

(setq doom-theme 'doom-solarized-light)

;;
;; lisp configs
;;
(use-package! lispy
  :hook ((common-lisp-mode . lispy-mode)
         (lisp-mode . lispy-mode)
         (emacs-lisp-mode . lispy-mode)
         (scheme-mode . lispy-mode)
         (racket-mode . lispy-mode)
         (hy-mode . lispy-mode)
         (lfe-mode . lispy-mode)
         (dune-mode . lispy-mode)
         (clojure-mode . lispy-mode))
  :config
  (setq lispy-close-quotes-at-end-p t)
  (add-hook 'lispy-mode-hook #'turn-off-smartparens-mode))

(use-package! lispyville
  :when (featurep! :editor evil)
  :hook (lispy-mode . lispyville-mode)
  :config
  (lispyville-set-key-theme
   '((operators normal)
     c-w
     (prettify insert)
     (atom-movement normal visual)
     slurp/barf-lispy
     (wrap normal insert)
     additional
     additional-insert
     (additional-wrap normal insert)
     (escape insert))))

;;
;; setup IRC
;;
(set-irc-server! "irc.devel.redhat.com"
                 `(:tls nil
                        :port 6667
                        :nick "nforrer"
                        :sasl-username ,(+pass-get-user "irc/devel.redhat.com")
                        :sasl-password (lambda (&rest _) (+pass-get-secret "irc/devel.redhat.com"))))

(after! lui-logging
  (enable-lui-logging-globally))

;;
;; setup GTD with org mode
;;
(after! org
  (setq org-agenda-files '("~/usr/gtd/inbox.org"
                           "~/usr/gtd/tickler.org"
                           "~/usr/gtd/gtd.org"))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/usr/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/usr/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %t")))

  (setq org-refile-targets '(("~/usr/gtd/gtd.org" :maxlevel . 3)
                             ("~/usr/gtd/someday.org" :maxlevel . 1)
                             ("~/usr/gtd/tickler.org" :maxlevel . 2))))

;;
;; GDScript
;;
(require 'gdscript-mode)
