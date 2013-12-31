;;14-depth.scm

;;normal version

(define depth*
  (lambda (l)
    (cond
     ((null? l) 1)
     ((atom? (car l))
      (depth* (cdr l)))
     (else
      (cond
       ((> (depth* (cdr l))
	   (add1 (depth* (car l))))
	(depth* (cdr l)))
       (else
	(add1 (depth* (car l)))))))))

(depth* '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))

(depth* '(a (b)))

;;depth*-let-1
;;A (let...) first determines the values of
;;the named expressions.Then it associates
;;a name with each value and determines
;;the value of the expression in the value
;;part.Since the value of the named expression
;;in our example depends on the value of
;;(car l) before we know whether or
;;not l is empry , this depth* is incorrect

(define depth*-let-1
  (lambda (l)
    (let ((a (add1 (depth*-let-1 (car l))))
	  (d (depth*-let-1 (cdr l))))
      (cond
       ((null? l) 1)
       ((atom? (car l)) d)
       (else (cond
	      ((> d a) d)
	      (else a)))))))

(depth*-let-1 '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))

(define depth*-let-2
  (lambda (l)
    (cond
     ((null? l) 1)
     ((atom? (car l))
      (depth*-let-2 (cdr l)))
     (else
      (let ((a (add1 (depth*-let-2 (car l))))
	    (d (depth*-let-2 (cdr l))))
	(cond
	 ((> d a) d)
	 (else a)))))))

(depth*-let-2 '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))


(define depth*-let-3
  (lambda (l)
    (cond
     ((null? l) 1)
     (else
      (let ((d (depth*-let-3 (cdr l))))
	(cond
	 ((atom? (car l)) d)
	 (else
	  (cond
	   ((> d (add1 (depth*-let-3 (car l)))) d)
	   (else (add1 (depth*-let-3 (car l))))))))))))

(depth*-let-3 '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))

;;The Fifteenth Commandment
;;revised version
;;Use (let...) to name the values of repeated expressions
;;in a function definition if they may be evaluated twice
;;for on e and the same use of the function


(define depth*-let-4
  (lambda (l)
    (cond
     ((null? l) 1)
     (else
      (let ((d (depth*-let-4 (cdr l))))
	    (cond
	     ((atom? (car l)) d)
	     (else
	      (let ((a (add1 (depth*-let-4 (car l)))))
		(cond
		 ((> d a) d)
		 (else a))))))))))

(depth*-let-4 '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))

(define depth*-let-final
  (lambda (l)
    (cond
     ((null? l) 1)
     ((atom? (car l))
      (depth*-let-final (cdr l)))
     (else
      (let ((a (add1 (depth*-let-final (car l))))
	    (d (depth* (cdr l))))
	(cond
	 ((> d a) d)
	 (else a)))))))

(depth*-let-final '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))

(define depth*-max
  (lambda (l)
    (cond
     ((null? l) 1)
     ((atom? (car l))
      (depth*-max (cdr l)))
     (else
      (let ((a (add1 (depth* (car l))))
	    (d (depth* (cdr l))))
	(max a d))))))

(depth*-max '(a (b (c))))




(define depth-test
  (lambda (l)
    
    (display "depth-test-begin")
    (newline)
    (display l)
    (newline)

    (cond
     ((null? l) 1)
     ((atom? (car l))
      (depth-test (cdr l)))
 ;     (display "atom!")
  ;    (newline)
   ;   (display l)
    ;  (newline)
     (else
      (display "else-1")
      (newline)
      (display l)
      (newline)
      (cond
       ((> (depth* (cdr l))
	   (add1 (depth* (car l))))
	(display ">")
	(newline)
	(depth* (cdr l)))
       (else


	(display "else 2")
	(newline)
	(display l)
	(newline)
	(display (car l))
	(newline)
	(display (cdr l))


	(add1 (depth* (car l)))))))))

(depth-test '(a (b (c))))
(depth-test '(((c) b) a))


(depth-test '(margarine
	  ((bitter butter)
	   (makes)
	   (batter (bitter)))
	  butter))
