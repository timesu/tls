(load "sub1.scm")
(load "4-multi.scm")

(define factorial
  (lambda (n m)
    (cond
     ((zero? m) 1)
     (else (multi n (factorial (sub1 m)))))))
