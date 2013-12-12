(load "2-member.scm")

;;first version
(define set?
  (lambda (lat)
    (cond
     ((null? lat) #t)
     (else
      (cond
       ((member? (car lat) (cdr lat)) #f)
       (else (set? (cdr lat))))))))

;;second version
(define set-2
  (lambda (lat)
    (cond
     ((null? lat) #t)
     ((member? (car lat) (cdr lat)) #f)
     (else (set-2 (cdr lat))))))

(set-2 '(apples peaches apples plum))
(set-2 '(apple 3 pear 4 9 apples 3))
(set-2 '(apple pear 3))
