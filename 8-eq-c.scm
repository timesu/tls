;;8-eq-c.scm

(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))
