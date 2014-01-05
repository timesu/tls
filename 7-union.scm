;;7-union.scm

(load "2-member.scm")

;;my version
(define union
  (lambda (set1 set2)
    (cond
     ((null? set1) set2)
     ((member? (car set1) set2)
      (union (cdr set1) set2))
     (else
      (cons (car set1) 
	    (union (cdr set1) set2))))))

(union '(stewed tomatoes and macaroni casserole) 
       '(macaroni and cheese))
