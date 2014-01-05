(load "atom.scm")
(load "add1.scm")

(define occur*
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     ((atom? (car lat)) 
      (cond
       ((eq? (car lat) a)
	(add1 (occur* a (cdr lat))))
       (else
	(occur* a (cdr lat)))))
     (else
      (+ (occur* a (car lat))   ;; fantasy plus oprator !!!
	 (occur* a (cdr lat)))))))

(occur* 'banana '((banana)
		  (split (((((banana ice))))
			 (cream (banana))
			 sherbet))
		  (banana)
		  (bread)
		  (banana brandy)))
