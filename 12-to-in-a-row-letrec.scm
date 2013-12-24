;;12-two-in-a-rwo-letrec.scm

;;first version

(define two-in-a-row-1?
  (lambda (lat)
    (letrec
	((W (lambda (a lat)
	      (cond
	       ((null? lat) #f)
	       (else (or (eq? (car lat) a)
			 (W (car lat)
			    (cdr lat))))))))
      (cond
       ((null? lat) #f)
       (else (W (car lat) (cdr lat)))))))

(define row-in-a-row-final
  (letrec
      ((W (lambda (a lat)
	    (cond
	     ((null? lat) #f)
	     (else (or (eq? (car lat) a)
		       (W (car lat)
			  (cdr lat))))))))
    (lambda (lat)
      (cond
       ((null? lat) #f)
       (else (W (car lat) (cdr lat)))))))
