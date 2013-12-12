;;7-subset.scm

;;first version
(define subset?
  (lambda (set1 set2)
    (cond
     ((null? set1) #t)
     (else
      (cond
       ((member? (car set1) set2)
	(subset? (cdr set1) set2))
       (else #f))))))

(subset? '(4 pounds of horseradish) 
	 '(four pounds chicken and 5 ounces horseradish))

(subset? '(5 chicken wings) 
	 '(5 hamburgers 2 pices fried chicken and light duckling wings))

;;second version
(define subset-2
  (lambda (set1 set2)
    (cond
     ((null? set1) #t)
     ((member? (car set1) set2)
      (subset-2 (cdr set1) set2))
     (else #f))))

;;and version
(define subset-and
  (lambda (set1 set2)
    (cond
     ((null? set1) #t)
     (else
      (and (member? (car set1) set2)
	   (subset? (cdr set1) set2))))))
