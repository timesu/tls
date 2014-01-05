(load "add1.scm")

(define length
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else
      (add1 (length (cdr lat)))))))

(length '(e a a a a 1))
