(load "sub1.scm")


(define pick
  (lambda (n lat)
    (cond
     ((zero? (sub1 n))(car lat))
      (else (pick (sub1 n) (cdr lat))))))

(pick 1 '(a b c d e))
