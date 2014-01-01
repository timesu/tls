;;letrec-pratice.scm
;;Test for letrec , let , let/cc

;;The Twelfth Commandment
;;use (letrec...) to remove arguments that do 
;;not change for recursive aplications


;;letrec
;;noremal version multirember in TLS CH3

(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) (quote()))
     ((eq? (car lat) a)
      (multirember a (cdr lat)))
     (else
      (cons (car lat)
	    (multirember a (cdr lat)))))))

(multirember 'cup '(coffee cup tea cup and hick cup))


;;letrec version , in TSS CH12
(define multirember-letrec
  (lambda (a lat)
    ((letrec
	 ((test (lambda (lat)
		  (cond
		   ((null? lat) (quote()))
		   ((eq? a (car lat))
		    (test (cdr lat)))
		   (else
		    (cons (car lat)
			  (test (cdr lat))))))))
       test)
  lat)))

(multirember-letrec 'cup '(coffee cup tea cup and hick cup))


;;(letrec ((mr...)) mr)
;;defines and returns a recursive function

;;((letrec ((mr..)) mr) lat)
;;It's the result of applying the
;;recursive function mr to lat

;;Note:
;;the same a makes sense only inside the
;;definition of multirember.In general,
;;the names for a function's arguments make sese
;;only inside of (lambda...)


;;A doesn't work version
;;mr doesn't what a is ....
(define mr
  (lambda (lat)
    (cond
     ((null? lat) (quote()))
     ((eq? a (car lat))
      (mr (cdr lat)))
     (else
      (cons (car lat)
	    (mr (cdr lat)))))))

(define multirember-n
  (lambda (a lat)
    (mr lat)))


;----------------------------------------------------------------------------
;;next is multirember-f

;;normal version multirember-f

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
       ((null? lat) (quote()))
       ((test? (car lat) a)
	((multirember-f test?) a
	 (cdr lat)))
       (else
	(cons (car lat)
	      ((multirember-f test?) a
	       (cdr lat))))))))

((multirember-f eq?)  'cup '(coffee cup tea cup and hick cup))

;;a letrec version
(define multirember-f-letrec
  (lambda (test?)
    (letrec
	((m-f
	  (lambda (a lat)
	    (cond
	     ((null? lat) (quote()))
	     ((test? (car lat) a)
	      (m-f a (cdr lat)))
	     (else
	      (cons (car lat)
		    (m-f a (cdr lat))))))))
    m-f)))

((multirember-f-letrec eq?)  'cup '(coffee cup tea cup and hick cup))

;;test for member?

;;normal version

(define member-normal
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     ((eq? (car lat) a)
      #t)
     (else
      (member-normal a (cdr lat))))))

(member-normal 'a '(a b c))

;;letrec version

(define member-letrec
  (lambda (a lat)
    (letrec 
	((member 
	  (lambda (lat)
	    (cond
	     ((null? lat) #f)
	     ((eq? (car lat) a) #t)
	     (else (member (cdr lat)))))))
      (member lat))))

(member-letrec (car '(a b)) '(a b c))

;;pratice for union

;;normal version

(define union
  (lambda (set1 set2)
    (cond
     ((null? set1) set2)
     ((member-letrec (car set1) set2)
      (union (cdr set1) set2))
     (else (cons (car set1)
		 (union (cdr set1) set2))))))

(union '(a b ) '(b c))

;;letrec version

(define union-letrec
  (lambda (set1 set2)
    (letrec
	((u
	  (lambda (set)
	    (cond
	     ((null? set) set2)
	     ((member-letrec (car set) set2)
	      (u (cdr set)))
	     (else (cons (car set)
			 (u (cdr set))))))))
      (u set1))))

;;Contrast
;;union-letrec (set1 set2)
;;u (set)
;;Since set1 is always changed , but set2 never
;;so just keep the changed changed changed set1


(union-letrec '(a b ) '(b c))

;;Repeat The twelfth Commandment
;;Use (letrec..) to remove arguments that do not
;;change for recursive application


;;define more than one function by putting more
;;than one function definition between the extra pair of
;;parenthese

(define union-more
  (lambda (set1 set2)
    (letrec
	(
	 (U (lambda (set)
	      (cond
	       ((null? set) set2)
	       ((M (car set) set2)
		(U (cdr set)))
	       (else (cons (car set)
			   (U (cdr set)))))))
	 (M ;;member....
	  (lambda (lat)
	    (letrec
		((N
		  (lambda (lat)
		    (cond
		     ((null? lat) #f)
		     ((eq? (car lat) a) #f)
		     (else (N  (cdr lat)))))))
	    (N lat))))
	 )
      (U set1))))

(union-more '(a b ) '(b c))

;;The Thirteenth Commandment
;;Use (letrec..) to hid and to protect functions
