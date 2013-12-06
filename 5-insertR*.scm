(load "atom.scm")

(define insertR*
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((atom? (car lat))
      (cond
       ((eq? (car lat) old)
	(cons old 
	      (cons new 
		    (insertR* new old 
			      (cdr lat)))))
       (else
	(cons (car lat) 
	      (insertR* new old 
			(cdr lat))))))
     (else
      (cons (insertR* new old 
		       (car lat)) 
	    (insertR* new old 
		      (cdr lat)))))))


(insertR* 'roast 'chuck  '((how much (wood)) could ((a (wood) chuck)) (((chuck)))
    (if (a) ((wood chuck))) could chuck wood)) 

			  
			  
			  
