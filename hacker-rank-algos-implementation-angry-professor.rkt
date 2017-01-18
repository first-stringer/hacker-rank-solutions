#lang racket

;; https://www.hackerrank.com/challenges/angry-professor

(define (read-list n)
  (if (= n 0)
    '()
    (cons (read) (read-list (sub1 n)))
    )
  )

(define (process-input ntc)
  (when (> ntc 0)
    (let* ([n (read)]
	   [k (read)]
	   [tlst (read-list n)]
	   )
      (if (< (- (length tlst) (count positive? tlst)) k)
	(displayln "YES")
	(displayln "NO")
	)
      )
    (process-input (sub1 ntc))
    )
  )

(process-input (read))

