(load "4-=.scm")

(define eqan?
  (lambda (n m)
    (cond
     ((and (number? n) (number? m))
      (equal n m))
     ((or (number? n) (number? m))
       #f)
     (else (eq? n m)))))

(eqan? 'a 1)

