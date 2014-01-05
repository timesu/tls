;;7-intersect.scm
(load "2-member.scm")

;;my version
(define intersect?
  (lambda (set1 set2)
    (cond
     ((null? set1) #f)
     ((member? (car set1) set2) #t)
     (else
      (intersect? (cdr set1) set2)))))

(intersect? '(stewed tomatoes and macaroni) '(macaroni and cheese))

;;or version
(define intersect-or
  (lambda (set1 set2)
    (cond
     ((null? set1) #f)
     (else (or (member? (car set1) set2)
	       (intersect-or (cdr set1) set2))))))

;;intersect , not ?
(define intersect
  (lambda (set1 set2)
    (cond
     ((null? set1) (quote()))
     ((member? (car set1) set2)
      (cons (car set1)
	    (intersect (cdr set1) set2)))
     (else 
      (intersect (cdr set1) set2)))))
