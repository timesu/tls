(load "atom.scm")

(define member? 
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     (else (or (eq? (car lat) a)
	       (member? a (cdr lat)))))))

(member? 'a '(a b c))
