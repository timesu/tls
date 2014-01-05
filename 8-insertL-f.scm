;;8-insertL-f.scm

(define insertL-f
  (lambda (test?)
    (lambda (new old lat)
      (cond
       ((null? lat) (quote ()))
       ((test? old (car lat))
	(cons new (cons old  (cdr lat))))
       (else
	(cons (car l) (insertL-f new old (cdr lat))))))))
