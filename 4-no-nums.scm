
;;my version
(define no-nums
  (lambda (lat)
    (cond
     ;Always put null? first here!!!!
     ((null? lat) (quote()))
     ((number? (car lat)) 
      (no-nums (cdr lat)))
     (else
     (cons (car lat) (no-nums (cdr lat)))))))

;;tls's version
(define no-numss
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     (else (cond
	    ((number? (car lat))
	     (no-numss (cdr lat)))
	    (else (cons (car lat)
			(no-numss
			 (cdr lat)))))))))

(no-numss '(1 a 2 b 3 c))
(no-nums '(1 a 2 b 3 c))

