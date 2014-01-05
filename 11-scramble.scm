;;11-scramble.scm

;;my version
(define pick-mine
  (lambda (n lat)
    (cond
     ((null? lat) (quote()))
     ((eq? n 1) (car lat))
     (else 
      (pick-mine (- n 1) (cdr lat))))))

(pick-mine 4 '(4 3 1 1 1))
(pick-mine  2 '(2 4 3 1 1 1))

;;TSS version

(define one?
  (lambda (n)
    (= n 1)))

(define pick
  (lambda (n lat)
    (cond
     ((one? n) (car lat))
     (else (pick (sub1 n ) (cdr lat))))))

(pick '4 '(4 3 1 1 1))

(define scramble-b
  (lambda (tup rev-pre)  ;;rev-pre stands for reversed prefix
    (cond
     ((null? tup) (quote ()))
     (else
      (cons (pick (car tup)
		  (cons (car tup) rev-pre))
	    (scramble-b (cdr tup)
			(cons (car tup) rev-pre)))))))

(define scramble
  (lambda (tup)
    (scramble-b tup (quote ()))))

(scramble '(1 2 3 4 5 6 7 8 9))
