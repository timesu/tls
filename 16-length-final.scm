;;length final version

(define L
  (lambda (length)
    (lambda (l)
      (cond
       ((null? l) 0)
       (else (add1 (length (cdr l))))))))

(define Y-N
  (lambda (L)
    (let ((h (lambda (l) (quote()))))
      (set! h
	    (L (lambda (arg) (h arg))))
    h)))

(define length-final (Y-N L))

(length-final '(a b c d))
