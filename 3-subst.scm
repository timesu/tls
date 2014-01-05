(define subst
  (lambda (new old lat)
    (cond 
     ((null? lat) (quote()))
     (else (cond 
	    ((eq? (car lat) old)
	     (cons new (cdr lat)))
	    (else (cons (car lat)
		   (subst new old 
			  (cdr lat)))))))))




(subst 3 4 (list 1 2 3 4 5))
(subst 'topping 'fudge '(ice cream with fudge for dessert))
