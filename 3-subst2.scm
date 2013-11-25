(define subst2
  (lambda (new o1 o2 lat)
    (cond 
     ((null? lat) (quote()))
    (else
     (cond
;      ((eq? (car lat) o1) (cons new (cdr lat)))
;      ((eq? (car lat) o2) (cons new (cdr lat)))
;better way
      ((or (eq? (car lat) o1) (eq? (car lat) o2))
       (cons new (cdr lat)))
     (else
      (cons (car lat) (subst2 new o1 o2 (cdr lat)))))))))

(subst2 'vanilla 'chocolate 'banana '(banana ice cream with chocolate topping))
