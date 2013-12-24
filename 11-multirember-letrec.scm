;; 11-multirember-letrec.scm

;;version which style in tls , 
;;well okay , a failed version

(define mr
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     ((eq? a (car lat))
      (mr (cdr lat)))
     (else
      (cons (car lat)
	    (mr (cdr lat)))))))

(define multirember-tls
  (lambda (a lat)
    (mr lat)))

(multirember-tls 'tuna '(shrimp salad tuna salad and tuna))

;;TSS version , use letrec

(define multirember-1
  (lambda (a lat)
    ((letrec
	 ((mr (lambda (lat)
		(cond
		 ((null? lat) (quote ()))
		 ((eq? a (car lat))
		  (mr (cdr lat)))
		 (else
		  (cons (car lat)
			(mr (cdr lat))))))))
	  mr)
       lat)))

(multirember-1 'tuna '(shrimp salad tuna salad and tuna))
