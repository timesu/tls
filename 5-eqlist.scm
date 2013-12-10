(load "atom.scm")
(load "4-eqan.scm")
(load "5-equal.scm")

;;first version
(define eqlist-1
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((and (null? l1) (atom? (car l2))) #f)
     ((null? l1) #f)
     ((and (atom? (car l1))
	   (atom? *(car l2)))
      (and (eqan? (car l1) (car l2))
	   (eqlist-1 (cdr l1) (cdr l2))))
     ((atom? (car l1)) #f)
     ((null? l2) #f)
     ((atom? (car l2)) #f)
     (else
      (and (eqlist-1 (car l1) (car l2))
	   (eqlist-1 (cdr l1) (cdr l2)))))))

;;second version
(define eqlist-2
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((or (null? l1) (null? l2)) #f)
     ((and (atom? (car l1))
	   (atom? (car l2)))
	   (and (eqan? (car l1) (car l2))
		(eqlist-2 (cdr l1) (cdr l2))))
      ((or (atom? (car l1))
	   (atom? (car l2))) #f)
      (else
       (and (eqlist-2 (car l1) (car l2))
	    (eqlist-2 (cdr l1) (cdr l2)))))))


;;third version , use equal?
(define eqlist-3
  (lambda (l1 l2)
    (codn
     ((and (null? l1) (null? l2) #t)
      ((or (null? l1) (null? l2) #f)
       (else
	(and (equal? (car l1) (car l2))
	     (eqlist? (cdr l1) (cdr l2)))))))))
