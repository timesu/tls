(load "4-plus.scm")


(define multi
  (lambda (n m)
    (cond
     ((zero? m) 0)
     (else (plus n (multi n (sub1 m)))))))

