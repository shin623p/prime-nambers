(asdf:defsystem :sieve-test
  :class :package-inferred-system
  :pathname "test"
  :defsystem-depends-on (:prove-asdf)
  :depends-on (:sieve/sieve
               :prove)
  :components ((:test-file "sieve-test"))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))
