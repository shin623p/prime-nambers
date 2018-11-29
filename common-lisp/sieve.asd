(asdf:defsystem :sieve
  :name "Sieve"
  :version "0.0.1"
  :class :package-inferred-system
  ;; :pathname ""
  :defsystem-depends-on (:asdf-package-system)
  :depends-on (:sieve/sieve))
