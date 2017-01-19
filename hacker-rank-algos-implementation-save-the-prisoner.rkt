#lang racket

;; https://www.hackerrank.com/challenges/save-the-prisoner

(define (process-input nt)
  (when (> nt 0)
    (let* ([n (read)]
	   [m (read)]
	   [s (read)]
	   [z (+ m (sub1 s))]
	   )
      (cond 
	[(<= z n) (displayln z)]
	[(= 0 (remainder z n)) (displayln n)]
	[else (displayln (remainder z n))]
	)
      )
    (process-input (sub1 nt))
    )
  )

(process-input (read))

