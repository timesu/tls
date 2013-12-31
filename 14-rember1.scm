;;14-rember1.scm
(define eqlist?
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((or (null? l1) (null? l2)) #f)
     (else
	(and (equal? (car l1) (car l2))
	     (eqlist? (cdr l1) (cdr l2)))))))



;;normal version
(define rember1*
  (lambda (a l)
    (cond
     ((null? l) (quote()))
     ((atom? (car l))
      (cond
       ((eq? (car l) a) (cdr l))
       (else (cons (car l)
		   (rember1* a (cdr l))))))
     (else
      (cond
       ((eqlist?
	 (rember1* a (car l))
	 (car l))
	(cons (car l)
	      (rember1* a (cdr l))))
       (else (cons (rember1* a (car l))
		   (cdr l))))))))

(rember1* 'meat '((pasta meat) 
		  pasta
		  (noodles meat sauce)
		  meat tomatoes))

(define rember1*-letrec
  (lambda (a l)
    (letrec
	((R (lambda (l)
	      (cond
	       ((null? l) (quote()))
	       ((atom? (car l))
		(cond
		 ((eq? (car l) a) (cdr l))
		 (else (cons (car l)
			     (R (cdr l))))))
	       (else
		(cond
		 ((eqlist?
		   (R (car l))
		   (car l))
		  (cons (car l)
			(R (cdr l))))
		 (else (cons (R (car l))
			     (cdr l)))))))))
      (R l))))

(rember1*-letrec 'meat '((pasta meat) 
		  pasta
		  (noodles meat sauce)
		  meat tomatoes))
