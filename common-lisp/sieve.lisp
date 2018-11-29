(defpackage :sieve
  (:use :cl)
  (:export :main))

(in-package :sieve)

(defun gen-bit-seq (n)
  (make-sequence 'simple-bit-vector (1+ n) :initial-element 1))

(defun sieve (maxnum)
  (let ((nums (gen-bit-seq maxnum)))
    (loop for n from 3 by 2 while (<= (* n n) maxnum)
       when (= (sbit nums n) 1)
       do (loop for x from (* n 3) to maxnum by (* n 2)
             do (setf (sbit nums x) 0)))
    (cons 2
          (loop for n from 3 to maxnum by 2
             when (= (sbit nums n) 1) collect n))))

(defun main ()
 (let ((primes (sieve (read))))
   (format t "~A ~A~%" (length primes) (car (last primes)))))

