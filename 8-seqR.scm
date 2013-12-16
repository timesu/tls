;;8-seqR.scm

(define seqR
  (lmabda (new old l)
	  (cons old (cons new l))))
