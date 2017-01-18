#lang racket

(define (my-reverse-helper x y)
  (if (= x 0)
    y
    (my-reverse-helper (quotient x 10) (+ (* y 10) (remainder x 10)))
    )
  )

(define (my-reverse x) 
  (my-reverse-helper x 0)
  )

(define (process-input x1 x2 k)
  (cond
    [(> x1 x2) 0]
    [(= 0 (remainder (abs (- x1 (my-reverse x1))) k)) (add1 (process-input (add1 x1) x2 k))]
    [(and (= 0 (quotient (abs (- x1 (my-reverse x1))) k))
	  (= k (remainder (abs (- x1 (my-reverse x1))) k)))
     (add1 (process-input (add1 x1) x2 k))]
    [else (process-input (add1 x1) x2 k)]
    )
  )

(process-input (read) (read) (read))

