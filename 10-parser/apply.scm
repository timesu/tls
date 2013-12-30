;;10-parser
;;apply.scm
(load "table.scm")

(define atom-to-action
  (lambda (e)
    (cond
   ;  (display atom-to-action)
   ;  (newline)
     ((number? e) *const)
     ((eq? e #t) *const)
     ((eq? e #f) *const)
     ((eq? e (quote cons)) *const)
     ((eq? e (quote car)) *const)
     ((eq? e (quote cdr)) *const)
     ((eq? e (quote null?)) *const)
     ((eq? e (quote eq?)) *const)
     ((eq? e (quote atom-for-apply)) *const)
     ((eq? e (quote zero?)) *const)
     ((eq? e (quote add1)) *const)
     ((eq? e (quote sub1)) *const)
     ((eq? e (quote number?)) *const)
     (else *identifier))))

(define list-to-action
  (lambda (e)
    (cond
     ((atom? (car e))
      (cond
       ((eq? (car e) (quote quote))
	*quote)
       ((eq? (car e) (quote lambda))
	*lambda)
       ((eq? (car e) (quote cond))
	*cond)
       (else *application)))
     (else *application))))

(define expression-to-action
  (lambda (e)
  ;  (display expression-to-action)
  ;  (newline)
    (cond
     ((atom-for-apply e)(atom-to-action e))
      (else (list-to-action e)))))

(define meaning
  (lambda (e table)
 ;   (display meaning)(newline)
    ((expression-to-action e) e table)))

(define value
  (lambda (e)
;    (display value)(newline)
    (meaning e (quote()))))

(define evcon
  (lambda (lines table)
    (cond
     ((else? (question-of (car lines)))
      (meaning (answer-of (car lines))
	       table))
     ((meaning (question-of (car lines))
	       table)
      (meaning (answer-of (car lines))
	       table))
      (else (evcon (cdr lines) table)))))

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define evlis
  (lambda (args table)
    (cond
     ((null? args) (quote()))
     (else
      (cons (meaning (car args) table)
	    (evlis (cdr args ) table))))))

(define *application
  (lambda (e table)
    (apply
     (meaning (function-of e) table)
     (evlis (arguments-of e) table))))

(define apply
  (lambda (fun vals)
    (cond
     ((primitive? fun)
      (apply-primitive
       (second fun) vals))
     ((non-primitive? fun)
      (apply-closure
       (second fun) vals)))))


(define apply-primitive
  (lambda (name vals)
    (cond
     ((eq? name (quote cons))
	   (cons (first vals) (second vals)))
     ((eq? name (quote car))
      (car (first vals)))
     ((eq? name (quote cdr))
      (cdr (first vals)))
     ((eq? name (quote null?))
      (null? (first vals)))
     ((eq? name (quote eq?))
      (eq? (first vals) (second vals)))
     ((eq? name (quote atom?))
      (atom? (first vals)))
     ((eq? name (quote zero?))
      (zero? (first vals)))
     ((eq? name (quote add1))
      (add1 (first vals)))
     ((eq? name (quote sub1))
      (sub1 (first vals)))
     ((eq? name (quote number?))
      (number? (first vals))))))

(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
	     (extend-table
	      (new-entry
	       (formals-of closure)
	       vals)
	      (table-of closure)))))
