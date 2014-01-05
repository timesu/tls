;;9-shift.scm
;;page 152
;;The function shift takes a pari whose first component
;;is a pari and builds a pari by shifting the second part
;;of the first component into the second component

(load "7-first.scm")
(load "7-second.scm")
(load "7-build.scm")

(define shift
  (lambda (pair)
    (build (first (first pair))
	   (build (second (first pair))
		  (second pair)))))
