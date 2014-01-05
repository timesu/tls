;;11-sum-of-prefixes.scm


(define sum-of-prefixes-b
  (lambda (sonssf tup)   ;;sonssf means sum of numbers seen so far
    (cond
     ((null? tup) (quote()))
     (else (cons (+ sonssf (car tup))
		 (sum-of-prefixes-b
		  (+ sonssf (car tup))
		  (cdr tup)))))))

(sum-of-prefixes-b '0 '(1 1 1))

(define sum-of-prefixes
  (lambda (tup)
    (sum-of-prefixes-b 0 tup)))
