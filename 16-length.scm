x;;16-length.scm

;;normal version
(define length
  (lambda (l)
    (cond
     ((null? l) 0)
     (else (add1 (length (cdr l)))))))

;;new

(define length-set1
  (let ((h (lambda (l) 0)))
    (set! h
	  (lambda (l)
	    (cond
	     ((null? l) 0)
	     (else (add1 (h (cdr l)))))))))

;;The Seventeenth Commandment
;;final version
;;Use (set! x) for (let ((x..))...) only if there is at least
;;one (lambda..) between it and the (let...) , 
;;or if the new value for x is a function that refers to x.


;;pratice-1
(define length1
  (let ((h (lambda (l) 0)))
    (set! h
	  (lambda (l)
	    (cond
	     ((null? l) 0)
	     (else (add1 (h (cdr l)))))))))

;;equal
(define h1
       (lambda (l)
	 0))

(define length1-a
  (let ()
    (set! h1
	  (lambda (l)
	    (cond
	     ((null? l) 0)
	     (else (add1 (h1 (cdr l)))))))
	  h1))


;;version2
(define h2
  (lambda (l)
    0))

(define length2
  (let ()
    (set! h2
	  (lambda (l)
	    (cond
	     ((null? l) 0)
	     (else (add1 (h1 (cdr l)))))))
    h2))

;;equal

(define h2-a
  (lambda (l)
    (cond
     ((null? l) 0)
     (else (add1 (h2-a (cdr l)))))))

(define length2-a
  (let()
    h2-a))

;;Third version
;;Eliminate version

(define L
  (lambda (length)
    (lambda (l)
      (cond
       ((null? l) 0)
       (else
	(add1 (length (cdr l))))))))

(define length-e
  (let ((h (lambda (l) 0)))
	(set! h
	      (L (lambda (arg) (h arg))))
	h))

(length-e '(a b c d))

(define Y-N
  (lambda (L)
    (let ((h (lambda (l) (quote()))))
	  (set! h
		(L (lambda (arg) (h arg))))
	  h)))

;;equal
(define Y-letrec
  (lambda (f)
    (letrec 
	((h (f (lambda (arg) (h arg)))))
      h)))

;;final version

(define length-final (Y-N L))

(length-final '(a b c d))
