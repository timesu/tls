;;8-value.scm

(load "8-atom-to-function.scm")
(load "6-1st-sub-exp.scm")
(load "6-2nd-sub-exp.scm")
(load "6-operator.scm")


(define value
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     (else
      ((atom-to-function
	(operator nexp))
       (value (1st-sub-exp nexp))
       (value (2nd-sub-exp nexp)))))))
