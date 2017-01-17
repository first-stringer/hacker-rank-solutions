#lang racket

;; https://www.hackerrank.com/challenges/sock-merchant

(define (process-input n st)
  (if (= n 0)
    0 
    (let ([x (read)])
      (if (set-member? st x)
	(add1 (process-input (sub1 n) (set-remove st x)))
	(process-input (sub1 n) (set-add st x))
	)
      )
    )
  )

(displayln (process-input (read) (set)))

