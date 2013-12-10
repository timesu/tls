(load "atom.scm")

(define member*
  (lambda (a lat)
    (cond
     ((null? lat) #f)
     ((atom? (car lat))
      (or ((eq? a (car lat) a)      ;;OR here !!!
	   (member* a (cdr lat))))
     (else
      (or (member* a (car lat))
	    (member* a (cdr lat)))))))

(member* 'chip '((potato) (chips ((with) fish) (chips))))
