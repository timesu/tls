(load "atom.scm")

(define subst*
  (lambda (new old lat)
    (cond
     ((null? lat) (quote()))
     ((atom? (car lat))
      (cond
       ((eq? old (car lat))
	(cons new (subst* new old (cdr lat))))
       (else
	(cons (car l) (subst* new old (cdr lat))))))
     (else
      (cons (subst* new old (car lat))
	    (subst* new old (cdr lat)))))))
