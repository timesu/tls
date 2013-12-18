;;9-align.scm

(define a-pair?
  (cond
   ((atom? x) #f)
   ((null? x) #f)
   ((null? (cdr x)) #f)
   ((null? (cdr (cdr x)) #t)
    (else #f))))

(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 (quote())))))

(define shift
  (lambda (pair)
    (build (first (first pair))
	   (build (second (first pair))
		  (second pair)))))

(define align
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     ((a-pair? (first pora))
      (align (shift pora)))
     (else (build (first pora)
		  (align (second pora)))))))
