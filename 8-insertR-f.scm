;;8-insertR-f.scm

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
       ((null? l) (quote()))
       ((test? (car l) old)
	(cons old (cons new (cdr l))))
       (else (cons (car l)
		   ((insertR-f test?) new old
		    (cdr l))))))))
