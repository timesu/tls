(load "5-equal.scm")

;;first version with equal
(define rember-1
  (lambda (s l)
    (cond
     ((null? l) (quote()))
     (else (cond
	    ((equal? (car l) s) (cdr l))
	    (else (cons (car l)
			(rember s
				(cdr l)))))))))

;;second version
(define rember
  (lambda (s l)
    (cond
     ((null? l) (quote()))
     ((equal? (car l) s) (cdr l))
     (else (cons (car l)
		 (rember s (cdr l)))))))
