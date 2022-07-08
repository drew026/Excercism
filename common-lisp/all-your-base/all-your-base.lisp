(in-package #:cl-user)
(defpackage #:all-your-base
  (:use #:common-lisp)
  (:export #:rebase))

(in-package #:all-your-base)

(defun to-base-10 (digits in-base)
  (when (and digits (> in-base 1))
  (loop for digit in digits
        for i from 1
      sum (* digit (expt in-base (- (list-length digits) i))) into result
      finally (return (or result '(0))))))

(defun from-base-10 (num out-base)
  (when (and num (> out-base 1))
    (loop with number = num
	 until (zerop number)
       collect (mod number out-base) into result
       do
	 (setf number (truncate number out-base))
       finally (return (or (nreverse result) '(0))))))

(defun rebase (list-digits in-base out-base)
  (from-base-10 (to-base-10  list-digits in-base) out-base))
