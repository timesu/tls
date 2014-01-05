(load "atom.scm")

(define leftmost
  (lambda (lat)
    (cond
     ((atom? (car l)) (car l))
     (else (leftmost (car l))))))

