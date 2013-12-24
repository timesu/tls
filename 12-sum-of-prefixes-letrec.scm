;;12-sum-of-prefixes-letrec.scm

(define sum-of-prefixes-letrec
  (lambda (tup)
    (letrec
	((S (lambda (sss tup)
	      (cond
	       ((null? tup) (quote()))
	       (else
		(cons (+ sss (car tup))
		      (S (+ sss (car tup))
			 (cdr tup))))))))
      (S 0 tup))))
