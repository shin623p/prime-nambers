(defpackage :sieve
  (:use :cl)
  (:export :main))

(in-package :sieve)

(declaim (optimize (speed 3) (debug 0) (safety 0) (compilation-speed 0)))

(declaim (ftype (function (fixnum) simple-bit-vector) gen-nums))
(defun gen-nums (n)
  (make-sequence 'simple-bit-vector n :initial-element 1))

(declaim (ftype (function (fixnum) simple-vector) gen-primes))
(defun gen-primes (n)
  (make-sequence 'simple-vector n))

(declaim (ftype (function (fixnum) (values simple-vector fixnum)) sieve))
(defun sieve (maxnum)
  (let ((nums (gen-nums (1+ maxnum))))
    (loop for n fixnum from 3 by 2 while (<= (the fixnum (* n n)) maxnum)
       when (= (sbit nums n) 1)
       do (loop for x fixnum from (the fixnum (* n n)) to maxnum by (* n 2)
             do (setf (sbit nums x) 0)))
    (let* ((primes-cnt (- (count 1 nums) (ash maxnum -1) 1))
           (primes (gen-primes primes-cnt)))
      (setf (svref primes 0) 2)
      (loop for n fixnum from 3 to maxnum by 2
         with x fixnum = 1
         when (= (sbit nums n) 1)
         do (setf (svref primes x) n)
           (setf x (1+ x)))
      (values primes primes-cnt))))

(defun main ()
  (multiple-value-bind (primes primes-cnt) (sieve (read))
    (format t "~A ~A~%" primes-cnt (svref primes (1- primes-cnt)))))
