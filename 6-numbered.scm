
;;first version
(define numbered-1
  (lambda (aexp)
    (cond
     ((atom? axep) (number? aexp))
     ((eq? (car (cdr aexp)) (quote +))
      (and (numbered-1 (car aexp))
	   (numbered-1
	    (car (cdr (cdr aexp))))))
     ((eq? (car (cdr aexp)) (quote *))
      (and (numbered-1 (car aexp))
	   (numbered-1
	    (car (cdr (cdr aexp))))))
     ((eq? (car (cdr aexp)) (quote ^))
      (and (numbered-1 (car aexp))
	   (numbered-1
	    (car (cdr (cdr aexp)))))))))

;;second version
(define numbered-2
  (lambda (aexp)
    (cond
     ((atom? aexp) (numbered-2 aexp))
     (else
      (and (numbered? (car aexp))
	   (numbered?
	    (car (cdr (cdr aexp)))))))))
