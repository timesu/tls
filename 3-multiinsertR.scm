(define multiinsertR
  (lambda (new old lat)
    (cond
     ((null? lat) (quote()))
     (else
      (cond
       ((eq? (car lat) old) 
	(cons old
	      (cons new (multiinsertR new old (cdr lat)))))
       (else
	(cons (car lat) (multiinsertR new old (cdr lat)))))))))

(define insertR
  (lambda (new old lat)
    (cond
     ((null? lat) (quote()))
     (else
      (cond
       ((eq? (car lat) old)
	(cons old
	      (cons new (cdr lat))))
       (else (cons (car lat) 
		   (insertR new old
			    (cdr lat)))))))))

(insertR 'testR 'cup '(coffee cup tea cup and kick cup))
(multiinsertR 'testR 'cup '(coffee cup tea cup and kick cup))
