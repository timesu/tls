;; 7-intersectall.scm

;;don't understand.....

(load "7-intersect.scm")

(define intersectall
  (lambda (l-set)
    (cond
     ((null? (cdr l-set)) (car l-set))
     (else(intersect (car l-set)
		     (intersectall (cdr l-set)))))))
