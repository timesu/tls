;;15-set.scm

(define x
  (cons (quote chicago)
	(cons (quote pizza)
	      (quote ()))))

(display x)

(set! x (quote gone))

(display x)

(define gourmet
  (lambda (food)
    (cons food
	  (cons x (quote())))))

(set! x (quote skins))

(gourmet (quote onion))

(define gourmand
  (lambda (food)
    (set! x food)
    (cons food
	  (cons x
		(quote())))))

(gourmand (quote potato))
