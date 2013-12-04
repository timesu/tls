(load "add1.scm")
(load "4-<.scm")
(load "4-minus.scm")

(define division
  (lambda (n m)
    (cond
     ((< n m) 0)
     (else
      (add1 (division (minus n m) m))))))

(division 15 4)
