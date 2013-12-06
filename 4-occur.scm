(load "add1.scm")

(define occur
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     (else
      (cond
       ((= (car lat) a) 
	(add1 (occur a (cdr lat))))
       (else (occur a (cdr lat))))))))

(occur '1 '(1 3 2 2 1))

