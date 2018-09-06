#|
  This file is a part of cl-sidecar project.
|#

(defsystem "cl-sidecar-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("cl-sidecar"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-sidecar"))))
  :description "Test system for cl-sidecar"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
