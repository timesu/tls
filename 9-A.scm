;;9-A.scm
;;Wilhelm Ackermann

(define add1
  (lambda (n)
    (+ n 1)))

(define sub1
  (lambda (n)
    (- n 1)))


(define A
  (lambda (n m)
    (cond
     ((zero? n) (add1 m))
     ((zero? m) (A (sub1 n) 1))
     (else (A (sub1 n)
	      (A n (sub1 m)))))))

(A 1 0)
