(load "4-plus.scm")

(define tup+
  (lambda (tup1 tup2)
    (cond 
     ((null? tup1) tup2)
     ((null? tup2) tup1)
      (else
       (cons (plus (car tup1) (car tup2))
	     (tup+ 
	      (cdr tup1) (cdr tup2)))))))

(tup+ (list 1 2 3 4) (list 2 3 4 5))
