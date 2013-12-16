;;8-rember-f

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
       ((null? l) (quote()))
       ((test? (car l) a) (cdr l))
       (else (cons (car l)
		   ((rember-f test?) a
		   (cdr l))))))))

((rember-f eq?) 'tuna '(shrimp salad and tuna salad))
