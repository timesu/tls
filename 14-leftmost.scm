;;14-leftmost.scm
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


;;Ch5 version
(define leftmost-1
  (lambda (l)
    (cond
     ((atom? (car l)) (car l))
     (else (leftmost-1 (car l))))))

(leftmost-1 '(((a) b) (c d)))
(leftmost-1 '(((() a) ())))

;;full version
(define leftmost-full
  (lambda (l)
    (cond
     ((null? l) (quote()))
     ((atom? (car l)) (car l))
     (else (cond
	    ((atom? (leftmost-full (car l)))
	     (leftmost-full (car l)))
	    (else (leftmost-full (cdr l))))))))

(leftmost-full '(((a) b) (c d)))
(leftmost-full '(((() a) ())))

;;leftmost-let
(define leftmost-let
  (lambda (l)
    (cond
     ((null? l) (quote()))
     ((atom? (car l)) (car l))
     (else
      (let ((a (leftmost-let (car l))))
	(cond
	 ((atom? a) a)
	 (else (leftmost-let (cdr l)))))))))

(leftmost-let '(((a) b) (c d)))
(leftmost-let '(((() a) ())))
