(defpackage cl-sidecar
  (:use #:cl
        #:snooze)
  (:export :app))
(in-package :cl-sidecar)

(defun find-symbol-or-lose (name package)
  (or (find-symbol (string name) (find-package package))
      (http-condition 404 "Sorry, no such symbol")))

(snooze:defroute lispdoc (:get :text/* name &key (package :cl) (doctype 'function))
                 (or (documentation (find-symbol-or-lose name package) doctype)
                     (http-condition 404 "Sorry, ~a doesn't have any ~a doc" name doctype)))

(snooze:defroute lispdoc (:post :text/plain name &key (package :cl) (doctype 'function))
                 (setf (documentation (find-symbol-or-lose name package) doctype)
                       (payload-as-string)))

(defvar app (snooze:make-clack-app))

;; blah blah blah.
