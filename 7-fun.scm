;;7-fun

(load "7-set.scm")

(define fun?
  (lambda (rel)
    (set? (firsts rel))))
