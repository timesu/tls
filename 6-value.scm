(load "6-1st-sub-exp.scm")
(load "6-2nd-sub-exp.scm")
(load "6-operator.scm")


;;value first version
(define value-1
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     ((eq? (car (cdr nexp)) (qipte +))
      (+ (value-1 (car nexp))
	 (value-1 (car (cdr (cdr nexp))))))
     ((eq? (car (cdr nexp)) (quote *))
      (* (value-1 (car nexp))
	 (value-1 (car (cdr (cdr nexp))))))
     (else
      (^ (value (car nexp))
	 (value
	  (car (cdr (cdr nexp)))))))))

;;second version , calculate (oprator number number)
(define value-2
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     ((eq? (operator nexp) (quote +))
      (+ (value (1st-sub-exp nexp))
	 (value (2nd-sub-exp nexp))))
     ((eq? (operator nexp) (quote *))
      (* (value (1st-sub-exp nexp))
	 (value (2nd-sub-exp nexp))))
     (else
      (^ (value (1st-sub-exp nexp))
	 (value (2nd-sub-exp nexp)))))))
