;;9-length.scm

(define length*
  (lambda (pora)
    (cond
     ((atom? pora) 1)
     (else
      (+ (length* (first pora))
	 (length* (second pora)))))))
