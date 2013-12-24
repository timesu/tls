;;12-member-letrec.scm

(define member-letrec?
  (lambda (a lat)
    (letrec
	((yes? (lambda (l)
		 (cond
		  ((null? l) #f)
		  ((eq? (car l) a) #t)
		  (else (yes? (cdr l)))))))
	 (yes? lat))))

(member-letrec? 'ice '(salad greens with pears brie cheese
			     frozen yogurt))
