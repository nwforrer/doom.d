;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! lispy)

(when (featurep! :editor evil)
  (package! lispyville))
