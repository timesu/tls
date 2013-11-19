(load "atom.scm")

(define rember
  (lambda (a lat)
    (cond 
     ((null? lat) (quote()))
     (else (cond
	    ((eq? (car lat) a) (cdr lat))
	    (else (cons (car lat)
			(rember a (cdr lat)))))))))

(rember 4 (list 1 2 3 4))

(define list-test '( a b c d))
(rember 'a list-test)
(rember 'd '( a b c d))
