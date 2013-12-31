;;13-rember-letcc.scm

(define rember
  (lambda (a lat)
    (letrec
	((R (lambda (lat)
	      (cond
	       ((null? lat) (quote()))
	       ((eq? (car lat) a) (cdr lat))
	       (else (cons (car lat)
			   (R (cdr lat))))))))
      (R lat))))

(rember 'a '(a b c))


;;rember-beyond-first 
;;The function rember-beyond-first takes
;;an atom a and a lat and , if a occurs in the
;;lat, removes all atoms from the lat beyond
;;and including the first occurence of a.

(define rember-beyond-first
  (lambda (a lat)
    (letrec
	((R 
	  (lambda (lat)
	    (cond
	     ((null? lat) (quote()))
	     ((eq? (car lat) a)
	      (quote()))
	     (else
	      (cons (car lat)
		    (R (cdr lat))))))))
	  (R lat))))

(rember-beyond-first 'others '(noodles
			       spaghetti spatzle bean-thread
			       roots
			       potatoes yam
			       others
			       rice))

;;rember-upto-last
;;Takes an atom a and a lat and removes all the
;;atoms from the lat up

(define rember-upto-last
  (lambda (a lat)
    (let/cc skip
	   (letrec
	       ((R (lambda (lat)
		     (cond
		      ((null? lat) (quote()))
		      ((eq? (car lat) a)
		       (skip (R (cdr lat))))
		      (else
		       (cons (car lat)
			      (R (cdr lat))))))))
	     (R lat)))))

(rember-upto-last 'cookies '(cookies
			     chocolate mints
			     caramel delight ginger snaps
			     desserts
			     chocolate mousse
			     vanilla ice cream
			     German chocolate cake
			     more cookies
			     gingerbreadman chocolate
			     chip brownies)) 
