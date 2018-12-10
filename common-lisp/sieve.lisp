(defpackage :sieve
  (:use :cl)
  (:export :main))

(in-package :sieve)

(declaim (optimize (speed 3) (debug 0) (safety 0) (compilation-speed 0)))
(declaim (ftype (function (fixnum) simple-bit-vector) gen-bit-seq))
(declaim (ftype (function (fixnum) (values simple-vector &optional fixnum)) sieve))

(defun gen-bit-seq (n)
  (make-sequence 'simple-bit-vector n :initial-element 1))

(defun sieve (maxnum)
  (let ((nums (gen-bit-seq (1+ maxnum))))
    (loop for n fixnum from 3 by 2 while (<= (* n n) maxnum)
       when (= (sbit nums n) 1)
       do (loop for x fixnum from (* n 3) to maxnum by (* n 2)
             do (setf (sbit nums x) 0)))
    (let* ((primes-cnt (- (count 1 nums) (ceiling (/ maxnum 2)) 1))
           (primes (make-sequence 'simple-vector primes-cnt)))
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
