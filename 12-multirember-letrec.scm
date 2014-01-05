;;12-multirember-letrec.scm

;;normal version , failed version

(define mr
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     ((eq? a (car lat))
      (mr (cdr lat)))
     (else
      (cons (car lat)
	    (mr (cdr lat)))))))

(define multirember-normal
  (lambda (a lat)
    (mr lat)))

(multirember-normal 'cup '(coffee cup tea cup and hick cup))

;;letrec version , works fine

(define multirember-letrec
  (lambda (a lat)
    ((letrec
	 ((mr (lambda (lat)
		(cond
		 ((null? lat) (quote()))
		 ((eq? a (car lat))
		  (mr (cdr lat)))
		 (else
		  (cons (car lat)
			(mr (cdr lat))))))))
	  mr)
       lat)))

(multirember-letrec 'pie '(apple custard pie linzer pie torte))

;;multirember-letrec-final

(define multirember-letrec-final
  (lambda (a lat)
    (letrec
	((mr (lambda (lat)
	       (cond
		((null? lat) (quote()))
		((eq? a (car lat))
		 (mr (cdr lat)))
		(else
		 (cons (car lat)
		       (mr (cdr lat))))))))
      (mr lat))))

(multirember-letrec-final 'pie '(apple custard pie linzer pie torte))
