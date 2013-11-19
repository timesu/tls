(define firsts
  (lambda (l)
    (cond
     ((null? l) (quote()))
     (else (cons (car (car l))
		 (firsts (cdr l)))))))

(firsts '((a c) (c d) (e f)))
