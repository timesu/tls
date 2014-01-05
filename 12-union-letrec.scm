;;12-union-letrec.scm


;;normal version

(define member?
  (lambda (a lat)
    (letrec
	((yes? (lambda (l)
		 (cond
		  ((null? l) #f)
		  ((eq? (car l) a) #t)
		  (else (yes? (cdr l)))))))
      (yes? lat))))

(member? 'and '(macaroni and cheese))

(define union-normal
  (lambda (set1 set2)
    (cond
     ((null? set1) set2)
     ((member? (car set1) set2)
      (union-normal (cdr set1) set2))
     (else (cons (car set1)
		 (union-normal (cdr set1) set2))))))

(union-normal '(tomatoes and macaroni casserold) '(macaroni and cheese))

;;letrec version


;;Since U is defined using (letrec...)
;;inside of union-letrec , it knows about all the 
;;things that union knows about
(define union-letrec
  (lambda (set1 set2)
    (letrec
	((U (lambda (set)
	      (cond 
	       ((null? set) set2)
	       ((member? (car set) set2)
		(U (cdr set)))
	       (else (cons (car set)
			   (U (cdr set))))))))
	 (U set1))))

(union-letrec '(tomatoes and macaroni) '(macaroni and cheese))


;;here is a member , 
;;it works , but with this new definition,
;;union will no longer work.
;;Because union assumes that member?
;;akes its arguments in a certain order.

(define member-not-work
  (lambda (lat a)
    (cond
     ((null? lat) #f)
     ((eq? (car lat) a) #t)
     (else (member? (cdr lat) a)))))



;;*****************************************
;;The Thirteenth Commandment
;;Use (letrec..) to hid and to protect functions.
;;*****************************************

(define union-final?
  (lambda (set1 set2)
    (letrec
	((U (lambda (set)
	      (cond
	       ((null? set) set2)
	       ((M? (car set) set2)
		(U (cdr set)))
	       (else (cons (car set)
			   (U (cdr set)))))))
	 (M? (lambda (a lat)
	       (cond
		((null? lat) (quote()))
		((eq? a (car lat) #t)
		 (else
		  (M? a (cdr lat))))))))
      (U set1))))

;;issue here is
;;M? : the recursive call to member? passes along the 
;;parameter a.
;;Ignores The Twelfth Commandment.


;;************************************
;;The Twelfth Commandment
;;Use (letrec...) to remove arguments that
;;do not change for recursive applications
;;*************************************


(define union-final
  (lambda (set1 set2)
    (letrec
	((U (lambda (set)
	      (cond
	       ((null? set) set2)
	       ((M? (car set) set2)
		(U (cdr set)))
	       (else (cons (car set)
			   (U (cdr set)))))))
	 (M? (lambda (a lat)
	       (letrec
		   ((N? (lambda (lat)
			  (cond
			   ((null? lat) #f)
			   ((eq? (car lat) a) #t)
			   (else (N? (cdr lat)))))))
		 (N? lat)))))
	 (U set1))))

(union-final '(tomatoes and macaroni) '(macaroni and cheese))
