(load "sub1.scm")

(define <
  (lambda (n m)
    (cond
     ((zero? m) #f)
     ((zero? n) #t)
     (else
      (< (sub1 n) (sub1 m))))))

(< 1 1)
(< 1 2)
(< 2 1)
