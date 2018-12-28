(in-package :cl-user)

(defpackage sieve-test
  (:use :cl
        :prove
        :sieve))
(in-package :sieve-test)

(setf *default-reporter* :list)

(plan 7)

(is #(2) (sieve:calc-up-to 2) :test #'equalp)
(is #(2 3) (sieve:calc-up-to 3) :test #'equalp)
(is #(2 3) (sieve:calc-up-to 4) :test #'equalp)
(is #(2 3 5 7 11 13 17 19 23) (sieve:calc-up-to 25) :test #'equalp)
(is #(2 3 5 7 11 13 17 19 23) (sieve:calc-up-to 23) :test #'equalp)
(is #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97) (sieve:calc-up-to 100) :test #'equalp)
(is 78498 (length (sieve:calc-up-to 1000000)))

(finalize)
