(load "sub1.scm")


(define rempick
  (lambda (n lat)
    (cond 
     ((zero? (sub1 n)) (cdr lat))
     (else
      (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

(rempick 3 '(a b c d))
