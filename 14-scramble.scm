;;14-scramble.scm

(define scramble
  (lambda (tup)
    (letrec
	((P (lambda (tup rp)
	      (cond
	       ((null? tup) (quote()))
	       (else
		(let ((rp (cons (car tup) rp)))
		  (cons (pick (car tup) rp)
			(P (cdr tup) rp))))))))
      (P tup (quote())))))
