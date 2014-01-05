;;7-eqset.scm
(load "7-subset.scm")

(define eqset?
  (lambda (set1 set2)
    (and (subset-and set1 set2)
	 (subset-and set2 set1))))
