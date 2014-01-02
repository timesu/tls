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


;;page 100 nibbler

(define nibbler
  (lambda (food)
    (let((x (quote dount)))
      (set! x food)
      (cons food
	    (cons x
		  (quote()))))))

(nibbler 'cheerio)

;;The Seventeenth Commandment
;;Use (set! x ..) for (let ((x...))...) only if
;;there is at least one (lambda ....) between it
;;and the (let ((x...)) ...).

(define food (quote none))

(define glutton
  (lambda (x)
    (set! food x)
    (cons (quote more)
	  (cons x
		(cons (quote more)
		      (cons x
			    (quote())))))))

(glutton 'garlic)
(display food)

;;The Eighteenth Commandment
;;Use (set! x..) only when the value that x
;;refers to is no longer needed.

(define chez-nous
  (lambda ()
    (let ((a food))
      (set! food x)
      (set! x a))))

(glutton 'garlic)
(display food)
(gourmand 'potato)
(display x)
(chez-nous)
(display food)
(display x)
