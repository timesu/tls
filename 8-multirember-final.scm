;;8-mulrember-final.scm


;;col means collector or continuation

(define a-freind
  (lambda (x y)
    (null? y)))

;;new collector
(define new-friend
  (lambda (newlat seen)
    (col newlat
	 (cons (car lat) seen))))

(define latest-friend
  (lambda (newlat seen)
    (a-friend (cons (quote and) newlat)
	      seen)))

(define multirember-final
  (lambda (a lat col)
    (cond
     ((null? lat)
      (col (quote()) (quote())))
     ((eq? (car lat) a)
      (multirember-final a
			 (cdr lat)
			 (lambda (newlat seen)
			   (col newlat
				(cons (car lat) seen)))))
     (else
      (multirember-final a
			 (cdr lat)
			 (lambda (newlat seen)
			   (col (cons (car lat) newlat)
				seen)))))))
