;;9-weight.scm
(load "atom.scm")

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


;;Counts the number of atoms in
;;align's arguments

(define weight*
  (lambda (pora)
    (cond
     ((atom? pora) 1)
     (else
      (+ (* (weight* (first pora)) 2)
	 (weight* (second pora)))))))

(weight* '((a b ) c))
(weight* '( a b ) )
(weight* '((a b ) c)) 
