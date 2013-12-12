;;7-fullfun

(load "7-set.scm")
(load "7-second.scm")
(load "7-revrel.scm")
(load "7-fun.scm")

(define fullfun?
  (lambda (fun)
    (set? (second fun))))

(fullfun? '((grape raisin)
	    (plum prune)
	    (stewed grape)))

;;amazing....

(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))
