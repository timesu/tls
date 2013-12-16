;;8-multiremberT.scm

(define multiremberT
  (lambda (test? lat)
    (cond
     ((null? lat) (quote()))
     ((test? (car lat))
      (multiremberT test? (cdr lat)))
     (else (cons (car lat)
		 (multiremberT test?
			       (cdr lat)))))))

(define eq?-tuna
  (eq?-c (quote tuna)))
