(load "add1.scm")
(load "sub1.scm")

(define plus
  (lambda (n m)
    (cond
     ((zero? m) n)
     (else (add1 (plus n (sub1 m)))))))


