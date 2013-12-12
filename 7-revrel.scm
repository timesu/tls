;;7-revrel.scm

(load "7-first.scm")
(load "7-second.scm")
(load "7-build.scm")


(define revrel
  (lambda (rel)
    (cond
     ((null? rel) (quote()))
     (else (cons (build
		  (second (car rel))
		  (first (car rel)))
		 (revrel (cdr rel)))))))
