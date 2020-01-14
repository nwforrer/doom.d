;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here


(setq +workspaces-on-switch-project-behavior t) ;; always create new workspace for project

(set-irc-server! "irc.devel.redhat.com"
                 `(:tls nil
                        :port 6667
                        :nick "nforrer"
                        :sasl-username ,(+pass-get-user "irc/devel.redhat.com")
                        :sasl-password (lambda (&rest _) (+pass-get-secret "irc/devel.redhat.com"))))
;; (enable-lui-logging-globally)
