(define all-nums
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     (else (cond
	    ((number? (car lat)) 
		      (cons (car lat) (all-nums (cdr lat))))
	    (else
	     (all-nums (cdr lat))))))))

(all-nums '(1 a 2 b 3 c))
