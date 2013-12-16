;;8-insertL-g.scm

(load "8-insert-g.scm")

(define insertL-g 
  (insert-g
   (lambda (new old l)
     (cons new (cons old l)))))
