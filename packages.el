;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! lispy)

(when (featurep! :editor evil)
  (package! lispyville))

(package! gdscript-mode
  :recipe (:host github
                 :repo "GDQuest/emacs-gdscript-mode"
                 :files ("*.el" "data/*.txt")))
