#|
  This file is a part of cl-sidecar project.
|#

(defsystem "cl-sidecar"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("snooze"
               "clack"
               "cl-json")
  :components ((:module "src"
                :components
                ((:file "cl-sidecar"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "cl-sidecar-test"))))
