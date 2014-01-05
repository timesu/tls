;;16-sweet-tooth.scm

(define sweet-tooth
  (lambda (food)
    (cons food
	  (cons (quote cake)
		(quote())))))

(define last 'angelfood)

(define sweet-toothL
  (lambda (food)
    (set! last food)
    (cons food
	  (cons (quote cake)
		(quote())))))

(sweet-toothL 'chocolate)
(display last)

(define ingredients (quote()))

(define sweet-toothR
  (lambda (food)
    (set! ingredients
	  (cons food ingredients))
    (cons food
	  (cons (quote cake)
		(quote())))))

(sweet-toothR 'chocolate)
(display ingredients)
(sweet-toothR 'fruit)
(display ingredients)
