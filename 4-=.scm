(load "sub1.scm")

(define equal
  (lambda (n m)
    (cond
    ((zero? m) (zero? n))
     ((zero? n) #f)
     (else(equal (sub1 n) (sub1 m))))))

(equal 1 1)
