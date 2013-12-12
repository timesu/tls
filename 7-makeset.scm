;;7-makeset.scm

(load "2-member.scm")
(load "3-multirember.scm")
;;first version
(define makeset
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     ((member? (car lat) (cdr lat))
      (makeset (cdr lat)))
     (else (cons (car lat)
		 (makeset (cdr lat)))))))

(makeset '(apple peach pear peach plum apple lemon peach))

;;second version
(define makeset-2
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     (else (cons (car lat)
		 (makeset
		  (multirember (car lat)
			       (cdr lat))))))))

(makeset-2 '(apple peach pear peach plum apple lemon peach))
