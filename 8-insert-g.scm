;;8-insert-g.scm

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
       ((null? l) (quote ()))
       ((eq? (car l) old)
	(seq new old (cdr l)))
       (esle (cons (car l)
		   ((insert-g seq) new old
		    (cdr l))))))))
