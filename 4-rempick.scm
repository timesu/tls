(load "sub1.scm")
(load "one.scm")

(define rempick
  (lambda (n lat)
    (cond 
     ((zero? (sub1 n)) (cdr lat))
     (else
      (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

;;one version
(define rempick-one
  (lambda (n lat)
    (cond
     ((one? n) (cdr lat))
     (else
      (cons (car lat) 
	    (rempick-one (sub1 n) 
			 (cdr lat)))))))

(rempick 3 '(a b c d))
(rempick-one 3 '(a b c d))
