;;15-dinner.scm

(define dinerR
  (lambda (food)
    (set! x food)
    (cons (quote millshake)
	  (cons food
		(quote())))))

(dinerR 'onion)

(define omnivore
  (let ((x (quote minestrone)))
    (lambda (food)
      (set! x food)
      (cons food
	    (cons x
		  (quote()))))))

(omnivore 'bouillabaisse)

;;The Sixteenth Commandment
;;Use (set!..) only with names defined in (let...)s

(define gobbler
  (let ((x (quote minestrone)))
    (lambda (food)
      (set! x food)
      (cons food
	    (cons x
		  (quote ()))))))

(gobbler 'gumbo)
