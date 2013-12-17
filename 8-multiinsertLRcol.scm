;;8-multiinsertLR-col

(define multiinsertLR-col
  (lmabda (new oldL oldR lat col)
	  (cond
	   ((null? lat)
	    (col (quote()) 0 0))
	   ((eq? (car lat) oldL)
	    (multiinsertLR-col new oldL oldR
			       (cdr lat)
			       (lambda (newlat L R)
				 (col (cons new
					    (cons oldL newlat))
				      (add1 L) R))))
	   ((eq? (car lat) oldR)
	    (multiinsertLR-col new oldL oldR
			       (cdr lat)
			       (lambda (newlat L R)
				 (col (cons oldR (cons new newlat))
				      L (add1 R)))))
	   (else
	    (multiinsertLR-col new oldL oldR
			       (cdr lat)
			       (lambda (newlat L R)
				 (col (cons (car lat) newlat)
				      L R)))))))
