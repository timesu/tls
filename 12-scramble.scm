;;12-scramble.scm

(define scramble-letrec
  (lambda (tup)
    (letrec
	((P (lambda (tup rp)
	      (cond
	       ((null? tup) (quote()))
	       (else (cons (pick (car tup)
				 (cons (car tup) rp))
			   (P (cdr tup)
			      (cons (car tup) rp))))))))
      (P tup (quote())))))
