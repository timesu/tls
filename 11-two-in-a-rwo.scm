;;11-two-in-a-rwo.scm
;;first version
(define is-first?
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     (else (eq? (car lat) a)))))

(define two-in-a-row-1?
  (lambda (lat)
    (cond
     ((null? lat) #f)
     (else
      (or (is-first? (car lat) (cdr lat))
	  (two-in-a-row-1? (cdr lat)))))))

(two-in-a-row-1? '(a  a b c))

(define two-in-a-row-b?
  (lambda (preceding lat)
    (cond
     ((null? lat) #f)
     (else (or (eq? (car lat) preceding)
	       (two-in-a-row-b? (car lat) 
				(cdr lat)))))))

(define two-in-a-row?
  (lambda (lat)
    (cond
     ((null? lat) #f)
     (else (two-in-a-row-b? (car lat)
			    (cdr lat))))))

(two-in-a-row? '(b d e i i a g))
