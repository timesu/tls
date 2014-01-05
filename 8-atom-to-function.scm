;;8-atom-to-function.scm

(define atom-to-function
  (lambda (x)
    (cond
     ((eq? x (quote +)) +)
     ((eq? x (quote *)) *)
     (else ^))))
