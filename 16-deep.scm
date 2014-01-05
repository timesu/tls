;;16-deep.scm
(load "2-member.scm")

(define deep
  (lambda (m)
    (cond
     ((zero? m) (quote pizza))
     (else (cons (deep (sub1 m))
		 (quote ()))))))

(deep 3)

(define Ns (quote()))
(define Rs (quote()))

(define deepR-1
  (lambda (n)
    (set! Ns (cons n Ns))
    (deep n)))

(deepR-1 3)
(display Ns)

;;write deep twice
(define deepR-2
  (lambda (n)
    (set! Rs (cons (deep n) Rs))
    (set! Ns (cons n Ns))
    (deep n)))

(deepR-2 3)
(display Ns)
(display Rs)

(define deepR-3
  (lambda (n)
    (let ((result (deep n)))
      (set! Rs (cons result Rs))
      (set! Ns (cons n Ns))
      result)))

(deepR-3 3)
(deepR-3 5)
(deepR-3 3)
(display Ns)
(display Rs)

;;The Nineteenth Commandment
;;Use (set! ...) to rember valuable things 
;;between two distinct uses of a function

;;find

(define find-1
  (lambda (n Ns Rs)
    (letrec
	((A (lambda (ns rs)
	      (cond
	       ((= (car ns) n ) (car rs))
	       (else
		(A (cdr ns) (cdr rs)))))))
      (A Ns Rs))))

(find-1 5 Ns Rs)

(define deepM
  (lambda (n)
    (if (member? n Ns)
	(find-1 n Ns Rs)
	(deepR n))))

(display Ns)
(display Rs)

(deepM 3)

(set! Ns (cdr Ns))
(set! Rs (cdr Rs))


(define deepM-2
  (lambda (n)
    (if (member? n Ns)
	(find-1 n Ns Rs)
	(let ((result (deep n)))
	  (set! Rs (cons result Rs))
	  (set! Ns (cons n Ns))
	  result))))
