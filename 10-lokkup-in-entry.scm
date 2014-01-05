;;10-lokkup-in-entry.scm

(load "7-first.scm")
(load "7-second.scm")

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
			  (first entry)
			  (second entry)
			  entry-f)))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
     ((null? names) (entry-f name))
     ((eq? (car names) name)
      (car values))
     (else (lookup-in-entry-help name
				 (cdr names)
				 (cdr values)
				 entry-f)))))

(lookup-in-entry 'entree '((appetizer entree beveage) 
			(pate boeuf vin)))
