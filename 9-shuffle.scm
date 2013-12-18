;;9-shuffle.scm
(load "7-pair.scm")

(define first
  (lambda (p)
    (car p)))
(first '(a (b c)))

(define second
  (lambda (p)
    (car (cdr p))))
(second '(a (b c)))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 (quote())))))

(build '(a) '(b))

(define a-pair?
  (lambda (x)
    (cond
     ((atom? x) #f)
     ((null? x) #f)
     ((null? (cdr x)) #f)
     ((null? (cdr (cdr x))) #t)
     (else #f))))

(a-pair? '(a))

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(atom? 'a)

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))



;;replace shift with revpair


(define shuffle
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     ((a-pair? (first pora))
      (shuffle (revpair pora)))
     (else (build (first pora)
		  (shuffle (second pora)))))))

(shuffle '(a (b c)))
(shuffle '((a b) (c d)))
