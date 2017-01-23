#lang racket

(define (add-to-list times number)
  (if (<= times 0) 
    '()
    (cons number (add-to-list (- times 1) number))
    )
  )

(define (list-replication times)
  (let ([line (read-line)]) 
    (if (non-empty-string? line) 
      (append
	(add-to-list times (string->number line)) 
	(list-replication times)
	)
      '()
      )
    )
  )

(for-each println (list-replication (string->number (read-line))))

