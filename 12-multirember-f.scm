;;12-multirember-f.scm

;;normal rember-f

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
       ((null? l) (quote()))
       ((test? (car l) a) (cdr l))
       (else (cons (car l)
		   ((rember-f test?) a
		    (cdr l))))))))

;;multirember-f
;;The function multirember-f accepts a function test?
;;and returns a new function.
;;Let's call this latter function m-f
;;The function m-f takes an atom a and a list
;;of atoms lat and traverses the later.
;;Any atom b in lat for which (test? b a) is true,
;;is removed.
(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
       ((null? lat) (quote()))
       ((test? (car lat) a )
	((multirember-f test?) a
	 (cdr lat)))
       (else (cons (car lat)
		   ((multirember-f test?) a
		    (cdr lat))))))))

;;multirember-f-letrec

(define multirember-f
  (lambda (test?)
    (letrec
	((m-f
	  (lambda (a lat)
	    (cond
	     ((null? lat) (quote()))
	     ((test? (car lat) a)
	      (m-f a (cdr lat)))
	     (else
	      (cons (car lat)
		    (m-f a (cdr lat))))))))
      m-f)))

;;another way , no lambda

(define multirember-no-lambda
  (letrec
      ((multirember
	(lambda (a lat)
	  (cond
	   ((null? lat) (quote()))
	   ((eq? (car lat) a)
	    (multirember a (cdr lat)))
	   (else
	    (cons (car lat)
		  (multirember a
			       (cdr lat))))))))
    multirember))
