;;8-evens-only-col.scm
(define the-last-friend
  (lambda (newl product sum)
    (cons sum
	  (cons product
		newl))))


(define evens-only-col
  (lambda (l col)
    (cond
     ((null? l)
      (col (quote()) 1 0))
     ((atom? (car l))
      (cond
       ((even? (car l))
	(evens-only-col (cdr l)
			(lambda (newl p s )
			  (col (cons (car l) newl)
			       (* (car l) p) s)))))
      (else (evens-only-col (cdr l)
			    (lambda (newl ps )
			      (col newl
				   p (+ (car l) s)))))
      (else (evens-only-col (car l) col ))))))
