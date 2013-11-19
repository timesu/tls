(define insertL
  (lambda (new old lat)
    (cond 
     ((null? lat) (quote()))
    (else (cond
;	   ((eq? (car lat) old)
;	    (cons new
;		  (cons old (cdr lat))))
;since (cons old (cdr lat)) where old is eq? to (car lat) is the same as lat
	   ((eq? (car lat) old)
	    (cons new lat))
	  (else (cons (car lat)
		      (insertL new old 
			       (cdr lat)))))))))

(insertL 'topping 'fudge '(isc cream with fudge for dessert))
