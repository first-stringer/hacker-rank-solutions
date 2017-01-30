#lang racket

;; https://www.hackerrank.com/challenges/fp-filter-array

(define (filter-array limit)
  (let ([line (read-line)]) 
    (if (non-empty-string? line) 
      (let ([n (string->number line)])
	(if (< n limit)
	  (cons n (filter-array limit))
	  (filter-array limit)
	  )
	)
      '()
      )
    )
  )

(for-each println (filter-array (string->number (read-line))))

